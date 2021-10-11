require 'rails_helper'

RSpec.describe 'Players', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/players'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /players/choose' do
    it 'returns http success' do
      post '/players/choose', params: { players_ids: [1, 2] }
      expect(response).to have_http_status(:success)
    end
  end
end
