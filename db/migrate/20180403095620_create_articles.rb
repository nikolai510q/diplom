class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :header
      t.string :announce
      t.text :body
      t.integer :user_id
      t.boolean :approved
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
