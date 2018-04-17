class CreateUsersSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :users_subscribers do |t|
    	t.integer :user_id
    	t.integer :subscriber_id

      t.timestamps
    end
  end
end
