require 'rails_helper'

RSpec.describe King, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = King.last

      # checking moves
      piece.valid_move?([5, 8], [5, 7])
      expect(true)

      piece.valid_move?([5, 8], [7, 6])
      expect(false)
    end
  end
end
