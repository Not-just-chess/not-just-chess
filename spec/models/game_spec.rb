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
end
