class ApplicationsTrainingProgram < ApplicationRecord
  has_many :constructor_trainings, foreign_key: :application_id
  belongs_to :user
end
