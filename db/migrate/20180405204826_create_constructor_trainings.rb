class CreateConstructorTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :constructor_trainings do |t|
      t.integer :application_id
      t.integer :exercises_id
      t.text :trainer_comment

      t.timestamps
    end
  end
end
