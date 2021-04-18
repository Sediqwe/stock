require 'test_helper'

class TranslaterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get translater_index_url
    assert_response :success
  end

end
