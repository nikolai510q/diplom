require 'test_helper'

class RedactorAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redactor_asset = redactor_assets(:one)
  end

  test "should get index" do
    get redactor_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_redactor_asset_url
    assert_response :success
  end

  test "should create redactor_asset" do
    assert_difference('RedactorAsset.count') do
      post redactor_assets_url, params: { redactor_asset: { assetable_id: @redactor_asset.assetable_id, assetable_type: @redactor_asset.assetable_type, created_at: @redactor_asset.created_at, data_content_type: @redactor_asset.data_content_type, data_file_name: @redactor_asset.data_file_name, data_file_size: @redactor_asset.data_file_size, updated_at: @redactor_asset.updated_at } }
    end

    assert_redirected_to redactor_asset_url(RedactorAsset.last)
  end

  test "should show redactor_asset" do
    get redactor_asset_url(@redactor_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_redactor_asset_url(@redactor_asset)
    assert_response :success
  end

  test "should update redactor_asset" do
    patch redactor_asset_url(@redactor_asset), params: { redactor_asset: { assetable_id: @redactor_asset.assetable_id, assetable_type: @redactor_asset.assetable_type, created_at: @redactor_asset.created_at, data_content_type: @redactor_asset.data_content_type, data_file_name: @redactor_asset.data_file_name, data_file_size: @redactor_asset.data_file_size, updated_at: @redactor_asset.updated_at } }
    assert_redirected_to redactor_asset_url(@redactor_asset)
  end

  test "should destroy redactor_asset" do
    assert_difference('RedactorAsset.count', -1) do
      delete redactor_asset_url(@redactor_asset)
    end

    assert_redirected_to redactor_assets_url
  end
end
