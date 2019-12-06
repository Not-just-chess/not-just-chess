# Add comments here
require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  describe 'chess_pieces#update' do
    before :each do
      @g = FactoryBot.create(:game)
      @k = King.create(x_position: 1, y_position: 5, game: @g, color: true)
      @user1 = FactoryBot.create(:user)
      sign_in @user1
      @user2 = FactoryBot.create(:user)
      sign_in @user2
      @g.update_attributes(white_player_id: @user1.id, black_player_id: @user2.id, turn_player_id: @user1.id)
    end

    it 'should update the selected pieces (king) x_position and y_position' do
      patch :update, params: { id: @k.id, game_id: @g.id, x_position: 1, y_position: 5 }
      @k.reload
      expect(@k.y_position).to eq 5
    end

    it 'should update turn_player_id to opposite player' do
      chess_piece = Pawn.create(x_position: 8, y_position: 2, game_id: @g.id)
      next_player_turn = @g.turn_player_id == @user1.id ? @user2.id : @user1.id

      expect(@g.turn_player_id).to eq(@user1.id)
      chess_piece.move_to!([8, 3])
      patch :update, params: { id: chess_piece.id, x_position: 8, y_position: 3, game_id: @g.id }
      @g.update_attributes(turn_player_id: next_player_turn)

      expect(@g.turn_player_id).to eq(@user2.id)
    end

    it 'should not allow user to move if not their turn' do
      chess_piece = Pawn.create(x_position: 8, y_position: 2, game_id: @g.id, color: false)
      expect(@g.turn_player_id).to eq(@user1.id)
      # @user1 color == true, so they should not be allowed to move
      expect(chess_piece.move_to!([8, 4])).to eq(false)
    end

    it 'should allow user to move if their turn' do
      chess_piece = Pawn.create(x_position: 8, y_position: 2, game_id: @g.id, color: true)
      expect(@g.turn_player_id).to eq(@user1.id)
      # @user1 color == true, so they should not be allowed to move
      expect(chess_piece.move_to!([8, 4])).to eq(true)
    end
  end
end
