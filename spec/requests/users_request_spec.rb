require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'deploys index action template' do
      get users_path
      expect(response).to render_template(:user_list)
    end

    it 'is a success' do
      get users_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'deploys show actiontemplate' do
      get user_path(1)
      expect(response).to render_template(:user_details)
    end

    it 'is a success' do
      get user_path(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
