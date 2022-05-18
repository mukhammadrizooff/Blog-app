require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user_test = User.create(name: 'Jhon', photo: 'url/photo', bio: 'Doe biography', postsCounter: 0)
    @post_test = Post.create(
      user: @user_test,
      title: 'Harry Potter versus Tom Riddle',
      text: 'Harry Potter first post content name',
      commentsCounter: 0,
      likesCounter: 0
    )
  end

  describe 'GET#index' do
    before { get user_posts_path(@user_test.id) }

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the posts list' do
      expect(response.body).to include('Harry Potter first post name')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET#show' do
    before { get user_post_path(@user_test.id, @post_test.id) }

    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the posts detail info' do
      expect(response.body).to include('Harry Potter first post name')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
