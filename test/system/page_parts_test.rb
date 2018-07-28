require "application_system_test_case"

class PagePartsTest < ApplicationSystemTestCase
  setup do
    @page_part = page_parts(:one)
  end

  test "visiting the index" do
    visit page_parts_url
    assert_selector "h1", text: "Page Parts"
  end

  test "creating a Page part" do
    visit page_parts_url
    click_on "New Page Part"

    fill_in "Content", with: @page_part.content
    fill_in "Contract", with: @page_part.contract_id
    fill_in "Name", with: @page_part.name
    click_on "Create Page part"

    assert_text "Page part was successfully created"
    click_on "Back"
  end

  test "updating a Page part" do
    visit page_parts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @page_part.content
    fill_in "Contract", with: @page_part.contract_id
    fill_in "Name", with: @page_part.name
    click_on "Update Page part"

    assert_text "Page part was successfully updated"
    click_on "Back"
  end

  test "destroying a Page part" do
    visit page_parts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Page part was successfully destroyed"
  end
end
