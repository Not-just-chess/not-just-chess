require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe 'valid_move?' do
    it 'checks for vertical or horizontal moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = Rook.last
      piece.update_attributes(x_position: 3, y_position: 3)

      # Vertical Move Up
      expect(piece.valid_move?([3, 6])).to eq(true)

      # Vertical Move Down
      expect(piece.valid_move?([3, 2])).to eq(true)

      # Horizontal Move Left
      expect(piece.valid_move?([2, 3])).to eq(true)

      # Horizontal Move right
      expect(piece.valid_move?([4, 3])).to eq(true)

      # Invalid: Does Not Move
      expect(piece.valid_move?([3, 3])).to eq(false)

      # Invalid: Diagonal Move
      expect(piece.valid_move?([4, 4])).to eq(false)
    end
  end
end
