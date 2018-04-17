class UsersRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  after_save :set_article_rating
  after_destroy :set_article_rating

  def self.check_mark(user_id, article_id)
    UsersRating.find_by(user_id: user_id, article_id: article_id).try(:id)
  end

  def set_article_rating
    article.set_rating
    article.save
  end
end
