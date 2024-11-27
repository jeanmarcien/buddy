require "test_helper"

class PethomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pethome_index_url
    assert_response :success
  end
end
