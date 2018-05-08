class AddColumnApprovedToRecordingsTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :recordings_trainings, :approved, :boolean
  end
end
