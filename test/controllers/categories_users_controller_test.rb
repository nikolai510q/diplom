require 'test_helper'

class CategoriesUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_user = categories_users(:one)
  end

  test "should get index" do
    get categories_users_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_user_url
    assert_response :success
  end

  test "should create categories_user" do
    assert_difference('CategoriesUser.count') do
      post categories_users_url, params: { categories_user: { category_id: @categories_user.category_id, user_id: @categories_user.user_id } }
    end

    assert_redirected_to categories_user_url(CategoriesUser.last)
  end

  test "should show categories_user" do
    get categories_user_url(@categories_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_user_url(@categories_user)
    assert_response :success
  end

  test "should update categories_user" do
    patch categories_user_url(@categories_user), params: { categories_user: { category_id: @categories_user.category_id, user_id: @categories_user.user_id } }
    assert_redirected_to categories_user_url(@categories_user)
  end

  test "should destroy categories_user" do
    assert_difference('CategoriesUser.count', -1) do
      delete categories_user_url(@categories_user)
    end

    assert_redirected_to categories_users_url
  end
end
