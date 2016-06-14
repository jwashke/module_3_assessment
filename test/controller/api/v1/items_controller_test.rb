class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end
end
When I send a GET request to /api/v1/items I receive a 200 JSON
response containing all items And each item has a name, description, and image_url but not the created_at or updated_at
