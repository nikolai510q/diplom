# :nodoc:
class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :users_ratings

  acts_as_commentable
  acts_as_taggable

  validates :user, :header, :announce, :body, presence: true

  before_save :set_rating
  

  scope :for_user, ->(user) {
    categories_ids = user.categories.pluck(:id)
    joins(:articles_categories)
      .where("user_id IN (?) OR articles_categories.category_id IN (?)", user.subscriptions_ids, categories_ids)
  }
  # FIXME: NEED CREATE SERVICE LAYER FOR NOTIFICATION
  # after_update :subscribers_notification

  # FIXME: (LOGIC AND PLACE)
  # Assign to Article categories that user checked
  def assign_categories(categories)
    categories.each do |key, _value|
      if category = Category.find_by_name(key)
        self.categories << category
      end
    end
  end

  # it takes all subscribers of article categories
  def list_of_subscribers
    list = []
    self.categories.each do |category|
      category.subscribers.each do |user|
        list << user.id
      end
    end
    list = list + user.subscriptions_ids
    list.uniq!
    list - [self.user_id]
  end


  def set_rating
    rate = 0
    users_ratings.each do |r|
      rate += 1 if r.mark == 1
      rate -= 1 if r.mark == 0
    end
    self.rating = rate
  end

  def current_user_voted_up? u_id
    r = users_ratings.find_by(user_id: u_id)
    if r
      r.mark == 1
    end
  end

  def current_user_voted_down? u_id
    r = users_ratings.find_by(user_id: u_id)
    if r
      r.mark == 0
    end
  end
end
