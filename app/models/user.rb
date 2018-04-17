class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         
         :recoverable,
         :rememberable, 
         :trackable, 
         :validatable

         

  has_many :articles, dependent: :destroy
  has_many :accounts, dependent: :destroy
  #new---------------
  has_many :comments
  has_and_belongs_to_many :categories

  has_many :follows, :foreign_key => "user_id", :dependent => :destroy
  has_many :subscribers, through: :follows
  #------------------
  validates :name, presence: true    

  #new--------------
  def access_token
    User.create_access_token(self)
  end

  def self.read_access_token(signature)
    id = verifier.verify(signature)
    User.find_by_id id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  # Verifier based on our application secret
  def self.verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base]) #???
  end

  # Class method for token generation
  def self.create_access_token(user)
    verifier.generate(user.id)
  end

  def sub_unsub_user(user)
    if self.subscribers.include?(user)
      self.subscribers.destroy(user)
    else
      self.subscribers << user
    end
  end

  def subscriptions_ids
    subscribers.pluck(:id)
  end
  #-----------------
end