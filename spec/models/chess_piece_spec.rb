require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  describe 'is_obstructed?' do
    it 'checks if bishop is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      bishop = Bishop.last
      expect(bishop.x_position).to eq(6)
      expect(bishop.y_position).to eq(8)
      expect(bishop.game_id).to eq(game.id)

      is_obs = bishop.is_obstructed?([6, 8], [8, 6])
      expect(is_obs).to be_truthy
    end

    it 'checks if pawn is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      pawn = Pawn.last
      expect(pawn.x_position).to eq(8)
      expect(pawn.y_position).to eq(7)
      expect(pawn.game_id).to eq(game.id)

      is_obs = pawn.is_obstructed?([8, 7], [8, 5])
      expect(is_obs).to be_falsey
    end
  end
end
