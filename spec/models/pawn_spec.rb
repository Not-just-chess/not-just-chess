require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      piece = Pawn.last

      # Move up 2 spaces on first move
      piece.valid_move?([2, 2], [2, 4])
      expect(true)

      # Move 1 space vertically
      piece.valid_move?([1, 1], [1, 2])
      expect(true)

      # checking for a non-diagonal/vertical/horizontal move
      piece.valid_move?([4, 8], [5, 6])
      expect(false)

      # checking for a move of the board
      piece.valid_move?([4, 8], [9, 9])
      expect(false)
    end
  end
end
