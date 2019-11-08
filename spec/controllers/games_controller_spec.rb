require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end

    describe 'games#show action' do
      it 'should successfully show the page if a game is found' do
      end
    end
  end
end
