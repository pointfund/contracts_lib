require 'test_helper'

class RecordListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_list = record_lists(:one)
  end

  test "should get index" do
    get record_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_record_list_url
    assert_response :success
  end

  test "should create record_list" do
    assert_difference('RecordList.count') do
      post record_lists_url, params: { record_list: { contract_id: @record_list.contract_id, var_list: @record_list.var_list } }
    end

    assert_redirected_to record_list_url(RecordList.last)
  end

  test "should show record_list" do
    get record_list_url(@record_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_list_url(@record_list)
    assert_response :success
  end

  test "should update record_list" do
    patch record_list_url(@record_list), params: { record_list: { contract_id: @record_list.contract_id, var_list: @record_list.var_list } }
    assert_redirected_to record_list_url(@record_list)
  end

  test "should destroy record_list" do
    assert_difference('RecordList.count', -1) do
      delete record_list_url(@record_list)
    end

    assert_redirected_to record_lists_url
  end
end
