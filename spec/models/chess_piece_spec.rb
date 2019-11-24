require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  describe 'is_obstructed?' do
    it 'checks if bishop is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      bishop = Bishop.last
      expect(bishop.x_position).to eq(6)
      expect(bishop.y_position).to eq(8)

      bishop.is_obstructed?([6, 8], [8, 6])
      expect(false)
    end
  end
end
