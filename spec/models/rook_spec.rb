require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe 'valid_move?' do
    before :each do
      @game = FactoryBot.create(:game)
      @rook = FactoryBot.create(:rook, x_position: 3, y_position: 3, game: @game, color: true)
      #Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: false, htmlcode: '&#x265F;')
    end

    context 'valid move' do
      it 'move up vertically' do
        expect(@rook.valid_move?([3, 3], [3, 6])).to eq(true)
      end
      it 'move down vertically' do
        expect(@rook.valid_move?([3, 3], [3, 2])).to eq(true)
      end

      it 'moves right horizontally' do
        expect(@rook.valid_move?([3, 3], [8, 3])).to eq(true)
      end

      it 'moves left horizontally' do
        expect(@rook.valid_move?([3, 3], [1, 3])).to eq(true)
      end
    end

    context 'invalid move' do
      it 'does not move' do
        expect(@rook.valid_move?([3, 3], [3, 3])).to eq(false)
      end

      it 'moves diagonally' do
        expect(@rook.valid_move?([3, 3], [5, 5])).to eq(false)
      end

      # Below Test Fails, returns true instead of false
      it 'obstruction' do
        rook = Rook.create(x_position: 0, y_position: 0, game: @game)
        pawn = Pawn.create(x_position: 0, y_position: 1, game: @game)
        
        @game.chess_pieces << rook
        @game.chess_pieces << pawn
        
        expect(@rook.valid_move?([0, 0], [0, 4])).to eq(false)
      end
    end
  end
end
