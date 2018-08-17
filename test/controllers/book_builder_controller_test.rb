require 'test_helper'

class BookBuilderControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get book_builder_show_url
    assert_response :success
  end

  test "should get edit" do
    get book_builder_edit_url
    assert_response :success
  end

end
