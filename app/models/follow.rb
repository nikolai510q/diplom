class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscriber, foreign_key: "subscriber_id", class_name: "User"
end
