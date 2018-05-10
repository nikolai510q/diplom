class ApplicationsTrainingProgram < ApplicationRecord
  has_many :constructor_trainings, foreign_key: :application_id
  belongs_to :user

  after_create :create_constructor
  validates :gender, presence: true
  validates :weight, presence: true
  validates :training_experiense, presence: true
  validates :training_per_week, presence: true
  validates :type_of_training, presence: true
  validates :physical_activity, presence: true
  validates :training_weight_info, presence: true
  validates :body_type, presence: true
  validates :user_wish, presence: true
  validates :growth, presence: true

  def create_constructor
    ConstructorTraining.create(application_id: self.id)
  end
end
