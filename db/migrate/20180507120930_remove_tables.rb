class RemoveTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :articles_categories
    drop_table :categories
    drop_table :categories_users
    drop_table :users_ratings
  end
end
