require 'test_helper'

class GuideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guide_index_url
    assert_response :success
  end

  test "should get start" do
    get guide_start_url
    assert_response :success
  end

  test "should get map" do
    get guide_map_url
    assert_response :success
  end

  test "should get login" do
    get guide_login_url
    assert_response :success
  end

end
