require 'test_helper'

class JekveriControllerTest < ActionDispatch::IntegrationTest
  test "should get beolvasas" do
    get jekveri_beolvasas_url
    assert_response :success
  end

end
