# Add comments here
require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
=begin
  describe 'chess_pieces#create' do
    it 'should allow new chess_pieces to be created' do
      user = FactoryBot.create(:user)
      sign_in user
      game1 = FactoryBot.create(:game)

      post :create, params: { chess_piece: {
        game_id: game1[:id],
        type: 'King'
      } }
      expect(response).to have_http_status(:success)

      king = ChessPiece.last
      expect(king.type).to eq('King')
      expect(king.game_id).to eq(game1[:id])
    end
  end
=end

  describe 'chess_pieces#update' do
    before :each do
      @g = FactoryBot.create(:game)
      @k = King.create(x_position: 1, y_position: 5, game: @g, color: true)
    end

    it 'should update the selected pieces (king) x_position and y_position' do
      user = FactoryBot.create(:user)
      sign_in user
      patch :update, params: { id: @k.id, game_id: @g.id, x_position: 1, y_position: 5 }
      @k.reload
      expect(@k.y_position).to eq 5
    end
  end
end
