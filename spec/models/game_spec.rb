require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'in_check?' do
    it 'should return true if king in check' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      FactoryBot.create(:king, color: true, game_id: game.id, x_position: 5, y_position: 1)
      FactoryBot.create(:bishop, color: false, game_id: game.id, x_position: 2, y_position: 4)
      expect(game.in_check?(true)).to eq(true)
    end

    it 'should return false if king is not in check' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      FactoryBot.create(:king, color: true, game_id: game.id, x_position: 5, y_position: 1)
      FactoryBot.create(:bishop, color: false, game_id: game.id, x_position: 7, y_position: 4)
      expect(game.in_check?(true)).to eq(false)
    end
  end

  describe 'stalemate!' do
    before :each do
      @game = FactoryBot.create(:game)
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @game.update_attributes(white_player_id: @user1.id, black_player_id: @user2.id, turn_player_id: @user1.id)
    end

    it 'should return true if the game is in stalemate' do
      FactoryBot.create(:king, color: true, game_id: @game.id, x_position: 1, y_position: 1)
      FactoryBot.create(:bishop, color: true, game_id: @game.id, x_position: 1, y_position: 2)
      FactoryBot.create(:queen, color: false, game_id: @game.id, x_position: 1, y_position: 3)
      FactoryBot.create(:rook, color: false, game_id: @game.id, x_position: 2, y_position: 3)
      # it is white players turn, so it should only check for the true pieces/king
      expect(@game.stalemate?(true)).to eq(true)
      expect(@game.stalemate!).to eq(true)
      expect(@game.draw?).to eq true
    end

    it 'should return false if the game is not in stalemate' do
      FactoryBot.create(:king, color: true, game_id: @game.id, x_position: 1, y_position: 1)
      FactoryBot.create(:pawn, color: false, game_id: @game.id, x_position: 5, y_position: 4)
      FactoryBot.create(:pawn, color: false, game_id: @game.id, x_position: 4, y_position: 5)
      # it is white players turn, so it should only check for the true pieces/king
      expect(@game.stalemate?(true)).to eq(false)
      expect(@game.stalemate!).to eq(false)
      expect(@game.draw?).to eq false
    end
  end
end
