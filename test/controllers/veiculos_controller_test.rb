require "test_helper"

class VeiculosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get veiculos_index_url
    assert_response :success
  end

  test "should get show" do
    get veiculos_show_url
    assert_response :success
  end
end
