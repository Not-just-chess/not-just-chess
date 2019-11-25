require 'rails_helper'

RSpec.describe Queen, type: :model do
    describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = Queen.last

      piece.valid_move?([4, 8], [4, 4])
      expect(true)

      piece.valid_move?([4, 8], [8, 4])
      expect(true)

      piece.valid_move?([4, 8], [5, 6])
      expect(false)
    end
  end
end
