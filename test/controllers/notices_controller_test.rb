require "test_helper"

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get link_through" do
    get notices_link_through_url
    assert_response :success
  end
end
