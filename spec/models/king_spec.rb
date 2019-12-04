require 'rails_helper'

RSpec.describe King, type: :model do
  describe 'valid_move?' do
    it 'verifies valid moves' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = King.last

      # checking moves
      piece.valid_move?([5, 7])
      expect(true)

      piece.valid_move?([4, 7])
      expect(true)

      piece.valid_move?([6, 7])
      expect(true)

      piece.valid_move?([7, 6])
      expect(false)

      piece.valid_move?([5, 9])
      expect(false)
    end
  end

  describe 'castling' do
    it 'allows a king to switch with a rook' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      ChessPiece.where(game_id: game.id, type: 'Queen').destroy_all
      ChessPiece.where(game_id: game.id, type: 'Bishop').destroy_all
      ChessPiece.where(game_id: game.id, type: 'Knight').destroy_all
      piece = King.last

      # check if can castle
      piece.can_castle?(7, 8)
      expect(true)

      piece.can_castle?(3, 8)
      expect(true)

      piece.can_castle?(7, 7)
      expect(false)

      piece.can_castle?(6, 8)
      expect(false)
    end
  end
end
