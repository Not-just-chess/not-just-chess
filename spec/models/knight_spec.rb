require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      piece = Knight.last

      # checking moves
      piece.valid_move?([2, 8], [3, 6])
      expect(true)

      piece.valid_move?([2, 8], [7, 6])
      expect(false)
    end
  end
end
