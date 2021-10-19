require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:one)
    @headers = user.create_new_auth_token
    @post = posts(:one)
  end

  test 'should get index' do
    get api_v1_posts_url, as: :json, headers: @headers
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post api_v1_posts_url,
           params: { content: @post.content, subreddit_id: @post.subreddit_id, title: @post.title }, as: :json, headers: @headers
    end

    assert_response 201
  end

  test 'should show post' do
    get api_v1_post_url(@post), as: :json, headers: @headers
    assert_response :success
  end

  test 'should update post' do
    patch api_v1_post_url(@post), params: { content: @post.content, title: @post.title }, as: :json, headers: @headers
    assert_response 200
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete api_v1_post_url(@post), as: :json, headers: @headers
    end

    assert_response 204
  end
end
