require 'test_helper'

class PdfPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pdf_page_index_url
    assert_response :success
  end

  test "should get show" do
    get pdf_page_show_url
    assert_response :success
  end

  test "should get create" do
    get pdf_page_create_url
    assert_response :success
  end

end
