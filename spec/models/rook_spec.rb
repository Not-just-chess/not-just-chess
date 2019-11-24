require 'rails_helper'

RSpec.describe Rook, type: :model do
  before :each do
    game = FactoryBot.create(:game)
    game.populate_game
    ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
  end

  describe 'valid moves' do
    it 'move up vertically' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [3, 6])).to eq(true)
    end

    it 'move down vertically' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [3, 2])).to eq(true)
    end

    it 'move left horizontally' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [2, 3])).to eq(true)
    end

    it 'move right horizontally' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [4, 3])).to eq(true)
    end
  end

  describe 'invalid moves' do
    it 'does not move' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [3, 3])).to eq(false)
    end

    it 'moves diagonally' do
      piece = Rook.last
      expect(piece.valid_move?([3, 3], [4, 4])).to eq(false)
    end
  end
end
