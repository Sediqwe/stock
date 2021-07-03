require 'test_helper'

class TesztControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teszt_index_url
    assert_response :success
  end

end
