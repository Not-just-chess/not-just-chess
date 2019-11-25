require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  describe 'find_piece' do
    it 'finds piece in given location and game' do
      game = FactoryBot.create(:game)
      game.populate_game

      piece = ChessPiece.where(game_id: game.id, x_position: 8, y_position: 8)
      expect(piece.type).to eq('Rook')
      expect(piece.game_id).to eq(game.id)
    end
  end

  describe 'capture_piece' do
    it '' do

    end
  end

  describe 'move_to!' do
    it 'determines if there is a piece already in destination square' do
      # move_to!(new_x, new_y)
    end

    it 'updates current location if destination empty' do
    end

    it 'captures opposing piece & updates current location if destination empty' do
    end
  end
end
