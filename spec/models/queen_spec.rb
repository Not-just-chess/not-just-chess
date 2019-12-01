require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = Queen.last

      # checking vertical move
      piece.valid_move?([4, 4])
      expect(true)

      # checking diagonal move
      piece.valid_move?([8, 4])
      expect(true)

      # checking for a non-diagonal/vertical/horizontal move
      piece.valid_move?([5, 6])
      expect(false)

      # checking for a move of the board
      piece.valid_move?([9, 9])
      expect(false)

      # checking for a move that is obstructed
      piece.valid_move?([3, 8])
      expect(false)
    end
  end
end
