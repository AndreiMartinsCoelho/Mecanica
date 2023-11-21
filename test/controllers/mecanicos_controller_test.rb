require "test_helper"

class MecanicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mecanicos_index_url
    assert_response :success
  end
end
