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
      game = FactoryBot.create(:game)
      game.populate_game

      piece = Pawn.first
      expect(piece.x_position).to eq(1)
      expect(piece.y_position).to eq(2)
      expect(piece.captured).to eq(nil)

      piece.capture_piece(1, 2)
      piece.reload

      expect(piece.x_position).to eq(nil)
      expect(piece.y_position).to eq(nil)
      expect(piece.captured).to eq(true)
    end
  end

  describe 'move_to!' do
    it 'moves piece if space empty or captures opposing team' do
      game = FactoryBot.create(:game)
      game.populate_game
      ChessPiece.where(game_id: game.id, type: 'Pawn').destroy_all
      piece = Bishop.last

      expect(piece.x_position).to eq(6)
      expect(piece.y_position).to eq(8)

      piece.move_to!([8, 6])
      piece.reload

      expect(piece.x_position).to eq(8)
      expect(piece.y_position).to eq(6)
    end
  end

  describe 'is_obstructed?' do
    it 'checks if bishop is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      bishop = Bishop.last
      expect(bishop.x_position).to eq(6)
      expect(bishop.y_position).to eq(8)
      expect(bishop.game_id).to eq(game.id)

      is_obs = bishop.is_obstructed?([8, 6])
      expect(is_obs).to be_truthy
    end

    it 'checks if pawn is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      pawn = Pawn.last
      expect(pawn.x_position).to eq(8)
      expect(pawn.y_position).to eq(7)
      expect(pawn.game_id).to eq(game.id)

      is_obs = pawn.is_obstructed?([8, 5])
      expect(is_obs).to be_falsey
    end

    it 'checks if rook is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      rook = Rook.last
      expect(rook.x_position).to eq(8)
      expect(rook.y_position).to eq(8)
      expect(rook.game_id).to eq(game.id)

      is_obs = rook.is_obstructed?([8, 5])
      expect(is_obs).to be_truthy
    end

    it 'checks if queen is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      queen = Queen.last
      expect(queen.x_position).to eq(4)
      expect(queen.y_position).to eq(8)
      expect(queen.game_id).to eq(game.id)

      is_obs = queen.is_obstructed?([4, 4])
      expect(is_obs).to be_truthy
    end

    it 'checks if king is obstructed during a move' do
      game = FactoryBot.create(:game)
      game.populate_game
      king = King.last
      expect(king.x_position).to eq(5)
      expect(king.y_position).to eq(8)
      expect(king.game_id).to eq(game.id)

      is_obs = king.is_obstructed?([5, 7])
      expect(is_obs).to be_truthy
    end
  end
end
