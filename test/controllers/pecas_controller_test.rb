require "test_helper"

class PecasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pecas_index_url
    assert_response :success
  end
end
