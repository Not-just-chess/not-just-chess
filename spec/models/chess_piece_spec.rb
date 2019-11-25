require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  describe 'find_piece' do
    it 'finds piece in given location and game' do
      game = FactoryBot.create(:game)
      game.populate_game
      og_piece = ChessPiece.last

      piece = og_piece.find_piece(8, 8).first
      expect(piece.type).to eq('Rook')
      expect(piece.x_position).to eq(8)
      expect(piece.y_position).to eq(8)
    end
  end

  describe 'capture_piece' do
    it 'updates target piece to captured and removes positions' do
      # game = FactoryBot.create(:game)
      # game.populate_game

      # piece = Pawn.where(game_id: game.id).first
      # expect(piece.x_position).to eq(1)
      # expect(piece.y_position).to eq(2)
      # expect(piece.captured).to eq(nil)

      # piece.capture_piece(1, 2)
      # expect(piece.x_position).to eq(nil)
      # expect(piece.y_position).to eq(nil)
      # expect(piece.captured).to eq(true)
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
