require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      pawn = FactoryBot.create(:pawn, x_position: 2, y_position: 2, game_id: game.id, color: true)

      # Move up 2 spaces on first move
      expect(pawn.valid_move?([2, 4])).to eq(true)

      # Move 1 space vertically
      expect(pawn.valid_move?([2, 3])).to eq(true)

      # Move forward diagonally to capture
      FactoryBot.create(:bishop, x_position: 3, y_position: 3, game_id: game.id, color: false)
      expect(pawn.valid_move?([3, 3])).to eq(true)
    end

    it 'verifies invalid moves' do
      game = FactoryBot.create(:game)
      pawn_x4_y4 = FactoryBot.create(:pawn, x_position: 4, y_position: 4, game_id: game.id, color: true)
      pawn_x2_y3 = FactoryBot.create(:pawn, x_position: 2, y_position: 3, game_id: game.id, color: true)
      pawn_x4_y8 = FactoryBot.create(:pawn, x_position: 4, y_position: 8, game_id: game.id, color: true)
      FactoryBot.create(:bishop, x_position: 2, y_position: 4, game_id: game.id, color: false)

      # Invalid Horizontal Move
      expect(pawn_x4_y4.valid_move?([5, 4])).to eq(false)

      # checking for a move that is obstructed
      expect(pawn_x2_y3.valid_move?([2, 5])).to eq(false)

      # checking for a move of the board
      expect(pawn_x4_y8.valid_move?([9, 9])).to eq(false)

      # checking for a non-diagonal/vertical/horizontal move
      expect(pawn_x4_y8.valid_move?([5, 6])).to eq(false)
    end
  end
end
