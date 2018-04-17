class CreateUsersRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :users_ratings do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :mark

      t.timestamps
    end
  end
end
