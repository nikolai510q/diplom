class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
    	t.integer :user_id
      t.integer :subscriber_id
    end
  end
end
