require 'test_helper'

class Ingredients::ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredients_images_index_url
    assert_response :success
  end

  test "should get update" do
    get ingredients_images_update_url
    assert_response :success
  end

end
