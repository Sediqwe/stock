require 'test_helper'

class SaveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get save_index_url
    assert_response :success
  end

  test "should get save" do
    get save_save_url
    assert_response :success
  end

end
