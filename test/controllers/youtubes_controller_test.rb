require 'test_helper'

class YoutubesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @youtube = youtubes(:one)
  end

  test "should get index" do
    get youtubes_url
    assert_response :success
  end

  test "should get new" do
    get new_youtube_url
    assert_response :success
  end

  test "should create youtube" do
    assert_difference('Youtube.count') do
      post youtubes_url, params: { youtube: { desc: @youtube.desc, done: @youtube.done, link: @youtube.link, title: @youtube.title } }
    end

    assert_redirected_to youtube_url(Youtube.last)
  end

  test "should show youtube" do
    get youtube_url(@youtube)
    assert_response :success
  end

  test "should get edit" do
    get edit_youtube_url(@youtube)
    assert_response :success
  end

  test "should update youtube" do
    patch youtube_url(@youtube), params: { youtube: { desc: @youtube.desc, done: @youtube.done, link: @youtube.link, title: @youtube.title } }
    assert_redirected_to youtube_url(@youtube)
  end

  test "should destroy youtube" do
    assert_difference('Youtube.count', -1) do
      delete youtube_url(@youtube)
    end

    assert_redirected_to youtubes_url
  end
end
