class CreateTrainers < ActiveRecord::Migration[5.1]
  def change
    create_table :trainers do |t|
      t.string :fio
      t.string :avatar
      t.timestamps
    end
  end
end
