class RecordingsTraining < ApplicationRecord
  belongs_to :user
  belongs_to :trainer
  validates :type_training, presence: true
  validates :time_training, presence: true
  validates :phone_number, format: { with: /((\+7|7|8)+([0-9]){10})/ }

  def trainer_name
    self.trainer.fio
  end
end
