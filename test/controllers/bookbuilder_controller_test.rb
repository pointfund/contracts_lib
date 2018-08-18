require 'test_helper'

class BookbuilderControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bookbuilder_show_url
    assert_response :success
  end

  test "should get play" do
    get bookbuilder_play_url
    assert_response :success
  end

  test "should get build_parts" do
    get bookbuilder_build_parts_url
    assert_response :success
  end

  test "should get build_layouts" do
    get bookbuilder_build_layouts_url
    assert_response :success
  end

  test "should get build_books" do
    get bookbuilder_build_books_url
    assert_response :success
  end

  test "should get build_contracts" do
    get bookbuilder_build_contracts_url
    assert_response :success
  end

end
