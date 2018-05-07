class ChangeConstructorTrainings < ActiveRecord::Migration[5.1]
  def change
    remove_column :constructor_trainings, :exercises_id
    add_column    :constructor_trainings, :exercises_ids, :jsonb, default: []
  end
end
