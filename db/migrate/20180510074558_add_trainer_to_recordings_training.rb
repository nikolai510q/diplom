class AddTrainerToRecordingsTraining < ActiveRecord::Migration[5.1]
  def change
    add_column :recordings_trainings, :trainer_id, :integer
  end
end
