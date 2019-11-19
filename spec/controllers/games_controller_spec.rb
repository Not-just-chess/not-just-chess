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
      expect(piece.type).to eq('King')
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

  describe 'populate_game' do
    it 'Adds Black Pawns to the board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 1, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 2, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 3, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 4, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 5, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 6, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 7, y_position: 7).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 8, y_position: 7).type).to eq('Pawn')
    end

    it 'Adds Black Rook to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 1, y_position: 8).type).to eq('Rook')
      expect(game.chess_pieces.find_by(x_position: 8, y_position: 8).type).to eq('Rook')
    end

    it 'Adds Black Knight to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 2, y_position: 8).type).to eq('Knight')
      expect(game.chess_pieces.find_by(x_position: 7, y_position: 8).type).to eq('Knight')
    end

    it 'Adds Black Bishop to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 3, y_position: 8).type).to eq('Bishop')
      expect(game.chess_pieces.find_by(x_position: 6, y_position: 8).type).to eq('Bishop')
    end

    it 'Adds Black Queen to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 4, y_position: 8).type).to eq('Queen')
    end

    it 'Adds Black King to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 5, y_position: 8).type).to eq('King')
    end

    it 'Adds White Pawns to the board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 1, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 2, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 3, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 4, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 5, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 6, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 7, y_position: 2).type).to eq('Pawn')
      expect(game.chess_pieces.find_by(x_position: 8, y_position: 2).type).to eq('Pawn')
    end

    it 'Adds White Rook to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 1, y_position: 1).type).to eq('Rook')
      expect(game.chess_pieces.find_by(x_position: 8, y_position: 1).type).to eq('Rook')
    end

    it 'Adds Black Knight to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 2, y_position: 1).type).to eq('Knight')
      expect(game.chess_pieces.find_by(x_position: 7, y_position: 1).type).to eq('Knight')
    end

    it 'Adds White Bishop to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 3, y_position: 1).type).to eq('Bishop')
      expect(game.chess_pieces.find_by(x_position: 6, y_position: 1).type).to eq('Bishop')
    end

    it 'Adds White Queen to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 4, y_position: 1).type).to eq('Queen')
    end

    it 'Adds White King to board' do
      user = FactoryBot.create(:user)
      sign_in user
      post :create
      game = Game.last
      game.populate_game

      expect(game.chess_pieces.find_by(x_position: 5, y_position: 1).type).to eq('King')
    end
  end
end
