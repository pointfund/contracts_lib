require "application_system_test_case"

class RecordListsTest < ApplicationSystemTestCase
  setup do
    @record_list = record_lists(:one)
  end

  test "visiting the index" do
    visit record_lists_url
    assert_selector "h1", text: "Record Lists"
  end

  test "creating a Record list" do
    visit record_lists_url
    click_on "New Record List"

    fill_in "Contract", with: @record_list.contract_id
    fill_in "Var List", with: @record_list.var_list
    click_on "Create Record list"

    assert_text "Record list was successfully created"
    click_on "Back"
  end

  test "updating a Record list" do
    visit record_lists_url
    click_on "Edit", match: :first

    fill_in "Contract", with: @record_list.contract_id
    fill_in "Var List", with: @record_list.var_list
    click_on "Update Record list"

    assert_text "Record list was successfully updated"
    click_on "Back"
  end

  test "destroying a Record list" do
    visit record_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Record list was successfully destroyed"
  end
end
