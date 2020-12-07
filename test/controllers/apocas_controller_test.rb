require 'test_helper'

class ApocasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apocas_index_url
    assert_response :success
  end

  test "should get show" do
    get apocas_show_url
    assert_response :success
  end

end
