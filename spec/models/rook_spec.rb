require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe 'valid_move?' do
    before :each do
      @game_id = FactoryBot.create(:game)
      @rook = Rook.create(x_position: 3, y_position: 3, game: @game_id, color: true)
    end

    context 'valid move' do
      it 'move up vertically' do
        expect(@rook.valid_move?(3, 6)).to eq(true)
      end

      it 'move down vertically' do
        expect(@rook.valid_move?(3, 2)).to eq(true)
      end

      it 'moves right horizontally' do
        expect(@rook.valid_move?(8, 3)).to eq(true)
      end

      it 'moves left horizontally' do
        expect(@rook.valid_move?(1, 3)).to eq(true)
      end
    end

    context 'invalid move' do
      it 'does not move' do
        expect(@rook.valid_move?(3, 3)).to eq(false)
      end

      it 'moves diagonally' do
        expect(@rook.valid_move?(5, 5)).to eq(false)
      end

      # it 'obstruction' do
      #  FactoryBot.create(:chess_piece, game_id: game.id, type: Pawn, x_position: 3, y_position: 5)
      #  expect(@rook.valid_move?(3, 8)).to eq(false)
      # end
    end
  end
end
