require "application_system_test_case"

class UploadsTest < ApplicationSystemTestCase
  setup do
    @upload = uploads(:one)
  end

  test "visiting the index" do
    visit uploads_url
    assert_selector "h1", text: "Uploads"
  end

  test "creating a Upload" do
    visit uploads_url
    click_on "New Upload"

    fill_in "Description", with: @upload.description
    fill_in "Name", with: @upload.name
    fill_in "User", with: @upload.user_id
    fill_in "Version", with: @upload.version
    click_on "Create Upload"

    assert_text "Upload was successfully created"
    click_on "Back"
  end

  test "updating a Upload" do
    visit uploads_url
    click_on "Edit", match: :first

    fill_in "Description", with: @upload.description
    fill_in "Name", with: @upload.name
    fill_in "User", with: @upload.user_id
    fill_in "Version", with: @upload.version
    click_on "Update Upload"

    assert_text "Upload was successfully updated"
    click_on "Back"
  end

  test "destroying a Upload" do
    visit uploads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Upload was successfully destroyed"
  end
end
