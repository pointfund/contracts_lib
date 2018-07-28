require "application_system_test_case"

class PageLayoutsTest < ApplicationSystemTestCase
  setup do
    @page_layout = page_layouts(:one)
  end

  test "visiting the index" do
    visit page_layouts_url
    assert_selector "h1", text: "Page Layouts"
  end

  test "creating a Page layout" do
    visit page_layouts_url
    click_on "New Page Layout"

    fill_in "Contract", with: @page_layout.contract_id
    fill_in "Name", with: @page_layout.name
    fill_in "Page Part", with: @page_layout.page_part
    fill_in "Posx", with: @page_layout.posx
    fill_in "Posy", with: @page_layout.posy
    click_on "Create Page layout"

    assert_text "Page layout was successfully created"
    click_on "Back"
  end

  test "updating a Page layout" do
    visit page_layouts_url
    click_on "Edit", match: :first

    fill_in "Contract", with: @page_layout.contract_id
    fill_in "Name", with: @page_layout.name
    fill_in "Page Part", with: @page_layout.page_part
    fill_in "Posx", with: @page_layout.posx
    fill_in "Posy", with: @page_layout.posy
    click_on "Update Page layout"

    assert_text "Page layout was successfully updated"
    click_on "Back"
  end

  test "destroying a Page layout" do
    visit page_layouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Page layout was successfully destroyed"
  end
end
