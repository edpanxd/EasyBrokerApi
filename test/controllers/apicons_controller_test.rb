require "test_helper"

class ApiconsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apicons_index_url
    assert_response :success
  end
end
