# Add comments here
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'games#new action' do
    it 'should require users to be logged in' do
      get :new
      expect(response).to(redirect_to(new_user_session_path))
    end

    it 'should successfully show the new form' do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'games#create action' do
    it 'should require users to be logged in' do
      post :create, params: { game: { white_player_id: 1 } }
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully create a new game' do
      user = FactoryBot.create(:user)
      sign_in user

      post :create
      game = Game.last
      expect(response).to redirect_to game_path(game.id)
      expect(game.user).to eq(user)
    end

    it 'should successfully populate the game' do
      user = FactoryBot.create(:user)
      sign_in user

      post :create
      game = Game.last

      piece = ChessPiece.last
      expect(piece.type).to eq('Queen')
      expect(piece.game_id).to eq(game.id)
    end
  end

  describe 'games#show action' do
    it 'should successfully show the page if a game is found' do
      game = FactoryBot.create(
        :game
      )
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end
end
