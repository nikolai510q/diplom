class CreateApplicationsTrainingPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :applications_training_programs do |t|
      t.integer :user_id
      t.boolean :gender
      t.integer :weight
      t.integer :age
      t.integer :training_experiense
      t.integer :training_per_week
      t.string :type_of_training
      t.string :physical_activity
      t.string :body_type
      t.text :training_weight_info
      t.text :user_wish

      t.timestamps
    end
  end
end
