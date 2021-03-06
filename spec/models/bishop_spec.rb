require 'rails_helper'

RSpec.describe Bishop, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = Bishop.last

      piece.valid_move?([8, 6])
      expect(true)

      piece.valid_move?([8, 5])
      expect(false)

      piece.valid_move?([8, 9])
      expect(false)
    end
  end
end
