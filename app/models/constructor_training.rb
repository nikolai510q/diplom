class ConstructorTraining < ApplicationRecord
  belongs_to :applications_training_program, foreign_key: 'application_id'
  has_one :user, through: :applications_training_program

  def exercises
    Exercise.where(id: self.exercises_ids)
  end
end
