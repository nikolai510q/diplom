json.extract! categories_user, :id, :category_id, :user_id, :created_at, :updated_at
json.url categories_user_url(categories_user, format: :json)
