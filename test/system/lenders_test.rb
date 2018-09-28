require "application_system_test_case"

class LendersTest < ApplicationSystemTestCase
  setup do
    @lender = lenders(:one)
  end

  test "visiting the index" do
    visit lenders_url
    assert_selector "h1", text: "Lenders"
  end

  test "creating a Lender" do
    visit lenders_url
    click_on "New Lender"

    fill_in "Lend Addr", with: @lender.lend_addr
    fill_in "Lend Contact", with: @lender.lend_contact
    fill_in "Lend Name", with: @lender.lend_name
    click_on "Create Lender"

    assert_text "Lender was successfully created"
    click_on "Back"
  end

  test "updating a Lender" do
    visit lenders_url
    click_on "Edit", match: :first

    fill_in "Lend Addr", with: @lender.lend_addr
    fill_in "Lend Contact", with: @lender.lend_contact
    fill_in "Lend Name", with: @lender.lend_name
    click_on "Update Lender"

    assert_text "Lender was successfully updated"
    click_on "Back"
  end

  test "destroying a Lender" do
    visit lenders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lender was successfully destroyed"
  end
end
