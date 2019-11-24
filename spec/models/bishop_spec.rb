require 'rails_helper'

RSpec.describe Bishop, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      piece = Bishop.last
      piece.valid_move?([3, 1], [6, 4])
      expect(response).to eq(true)

      piece.valid_move?([3, 1], [6, 5])
      expect(response).to eq(false)

      piece.valid_move?([3, 1], [6, 9])
      expect(response).to eq(false)
    end
  end
end
