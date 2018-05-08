class ApplicationsTrainingProgram < ApplicationRecord
  has_many :constructor_trainings, foreign_key: :application_id
  belongs_to :user

  after_create :create_constructor

  def create_constructor
    ConstructorTraining.create(application_id: self.id)
  end
end
