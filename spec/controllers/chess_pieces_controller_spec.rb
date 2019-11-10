# Add comments here
require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
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
end
