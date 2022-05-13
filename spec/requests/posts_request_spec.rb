require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'deploys index action template' do
      get '/users/1/posts'
      expect(response).to render_template(:post_list)
    end

    it 'is a success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'deploys show action template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:post_details)
    end

    it 'is a success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:ok)
    end
  end
end
