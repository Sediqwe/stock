require 'test_helper'

class TranslatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translate = translates(:one)
  end

  test "should get index" do
    get translates_url
    assert_response :success
  end

  test "should get new" do
    get new_translate_url
    assert_response :success
  end

  test "should create translate" do
    assert_difference('Translate.count') do
      post translates_url, params: { translate: { gta_id: @translate.gta_id, gta_original: @translate.gta_original, status: @translate.status, string_add: @translate.string_add, type: @translate.type, user_id_id: @translate.user_id_id, xml_name: @translate.xml_name, xml_palce: @translate.xml_palce } }
    end

    assert_redirected_to translate_url(Translate.last)
  end

  test "should show translate" do
    get translate_url(@translate)
    assert_response :success
  end

  test "should get edit" do
    get edit_translate_url(@translate)
    assert_response :success
  end

  test "should update translate" do
    patch translate_url(@translate), params: { translate: { gta_id: @translate.gta_id, gta_original: @translate.gta_original, status: @translate.status, string_add: @translate.string_add, type: @translate.type, user_id_id: @translate.user_id_id, xml_name: @translate.xml_name, xml_palce: @translate.xml_palce } }
    assert_redirected_to translate_url(@translate)
  end

  test "should destroy translate" do
    assert_difference('Translate.count', -1) do
      delete translate_url(@translate)
    end

    assert_redirected_to translates_url
  end
end
