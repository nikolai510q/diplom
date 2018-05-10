class RemoveColumnRatingFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :rating
  end
end
