require "test_helper"

class BoasVindaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boas_vinda_index_url
    assert_response :success
  end
end
