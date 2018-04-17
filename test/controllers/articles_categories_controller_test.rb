require 'test_helper'

class ArticlesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articles_category = articles_categories(:one)
  end

  test "should get index" do
    get articles_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_articles_category_url
    assert_response :success
  end

  test "should create articles_category" do
    assert_difference('ArticlesCategory.count') do
      post articles_categories_url, params: { articles_category: { article_id: @articles_category.article_id, category_id: @articles_category.category_id } }
    end

    assert_redirected_to articles_category_url(ArticlesCategory.last)
  end

  test "should show articles_category" do
    get articles_category_url(@articles_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_articles_category_url(@articles_category)
    assert_response :success
  end

  test "should update articles_category" do
    patch articles_category_url(@articles_category), params: { articles_category: { article_id: @articles_category.article_id, category_id: @articles_category.category_id } }
    assert_redirected_to articles_category_url(@articles_category)
  end

  test "should destroy articles_category" do
    assert_difference('ArticlesCategory.count', -1) do
      delete articles_category_url(@articles_category)
    end

    assert_redirected_to articles_categories_url
  end
end
