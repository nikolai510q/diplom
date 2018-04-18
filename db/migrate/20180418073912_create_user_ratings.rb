class CreateUserRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :users_ratings do |t|
    	t.integer :user_id
      t.integer :article_id
      t.integer :mark
      t.timestamps null: false
    end
  end
end
