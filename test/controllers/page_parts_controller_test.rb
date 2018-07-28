require 'test_helper'

class PagePartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_part = page_parts(:one)
  end

  test "should get index" do
    get page_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_page_part_url
    assert_response :success
  end

  test "should create page_part" do
    assert_difference('PagePart.count') do
      post page_parts_url, params: { page_part: { content: @page_part.content, contract_id: @page_part.contract_id, name: @page_part.name } }
    end

    assert_redirected_to page_part_url(PagePart.last)
  end

  test "should show page_part" do
    get page_part_url(@page_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_part_url(@page_part)
    assert_response :success
  end

  test "should update page_part" do
    patch page_part_url(@page_part), params: { page_part: { content: @page_part.content, contract_id: @page_part.contract_id, name: @page_part.name } }
    assert_redirected_to page_part_url(@page_part)
  end

  test "should destroy page_part" do
    assert_difference('PagePart.count', -1) do
      delete page_part_url(@page_part)
    end

    assert_redirected_to page_parts_url
  end
end
