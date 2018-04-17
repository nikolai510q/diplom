class CreateRecordingsTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings_trainings do |t|
      t.integer :user_id
      t.string :type_training
      t.datetime :time_training
      t.string :trainer_name
      t.string :phone_number

      t.timestamps
    end
  end
end
