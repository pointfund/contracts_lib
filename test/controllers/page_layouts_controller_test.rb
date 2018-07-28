require 'test_helper'

class PageLayoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_layout = page_layouts(:one)
  end

  test "should get index" do
    get page_layouts_url
    assert_response :success
  end

  test "should get new" do
    get new_page_layout_url
    assert_response :success
  end

  test "should create page_layout" do
    assert_difference('PageLayout.count') do
      post page_layouts_url, params: { page_layout: { contract_id: @page_layout.contract_id, name: @page_layout.name, page_part: @page_layout.page_part, posx: @page_layout.posx, posy: @page_layout.posy } }
    end

    assert_redirected_to page_layout_url(PageLayout.last)
  end

  test "should show page_layout" do
    get page_layout_url(@page_layout)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_layout_url(@page_layout)
    assert_response :success
  end

  test "should update page_layout" do
    patch page_layout_url(@page_layout), params: { page_layout: { contract_id: @page_layout.contract_id, name: @page_layout.name, page_part: @page_layout.page_part, posx: @page_layout.posx, posy: @page_layout.posy } }
    assert_redirected_to page_layout_url(@page_layout)
  end

  test "should destroy page_layout" do
    assert_difference('PageLayout.count', -1) do
      delete page_layout_url(@page_layout)
    end

    assert_redirected_to page_layouts_url
  end
end
