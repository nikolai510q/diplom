class RemoveTrainerNameFromRecordingTrainers < ActiveRecord::Migration[5.1]
  def change
    remove_column :recordings_trainings, :trainer_name
  end
end
