require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      piece = Pawn.last

      # checking initial double move
      piece.valid_move?([8, 7], [8, 5])
      expect(true)

      # checking double move is not valid anymore by from initial placement
      piece.valid_move?([8, 6], [8, 4])
      expect(false)

      # checking for single move
      piece.valid_move?([8, 7], [8, 6])
      expect(true)

      # checking for single move starting from other than initial placement
      piece.valid_move?([8, 6], [8, 5])
      expect(true)

      # checking for a move that is obstructed
    end
  end
end
