class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  acts_as_followable
  acts_as_follower

  has_many :articles, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :recordings_trainings
  #new---------------
  has_many :comments
  has_and_belongs_to_many :categories


  #------------------
  validates :name, presence: true

  def full_name
    self.name.to_s + ' ' + self.lastname.to_s
  end

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

  def subscriptions_ids
    following_users.pluck(:id)
  end
  #-----------------
end
