require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user_test = User.create(name: 'Jhon', photo: 'url/photo', bio: 'Doe biography', postsCounter: 0)
  end

  describe 'GET #index' do
    before { get users_path }

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the users list' do
      expect(response.body).to include('Jhon')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET#show' do
    before { get user_path(@user_test.id) }

    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the users detail info' do
      expect(response.body).to include('Jhon')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
