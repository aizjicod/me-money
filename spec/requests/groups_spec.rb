require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :each do
    @user = User.create(name: 'Alejandro Torres', email: 'test@example.com', password: '123123',
                        password_confirmation: '123123')
    @group = Group.create(name: 'Games', icon: 'GamesIcon', user: @user)
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get groups_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get group_path(@group.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_path
      expect(response).to be_successful
    end
  end
end
