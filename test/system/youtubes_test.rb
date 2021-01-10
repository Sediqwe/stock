require "application_system_test_case"

class YoutubesTest < ApplicationSystemTestCase
  setup do
    @youtube = youtubes(:one)
  end

  test "visiting the index" do
    visit youtubes_url
    assert_selector "h1", text: "Youtubes"
  end

  test "creating a Youtube" do
    visit youtubes_url
    click_on "New Youtube"

    fill_in "Desc", with: @youtube.desc
    check "Done" if @youtube.done
    fill_in "Link", with: @youtube.link
    fill_in "Title", with: @youtube.title
    click_on "Create Youtube"

    assert_text "Youtube was successfully created"
    click_on "Back"
  end

  test "updating a Youtube" do
    visit youtubes_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @youtube.desc
    check "Done" if @youtube.done
    fill_in "Link", with: @youtube.link
    fill_in "Title", with: @youtube.title
    click_on "Update Youtube"

    assert_text "Youtube was successfully updated"
    click_on "Back"
  end

  test "destroying a Youtube" do
    visit youtubes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Youtube was successfully destroyed"
  end
end
