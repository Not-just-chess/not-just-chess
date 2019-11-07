# Add comments here
class ChessPiecesController < ApplicationController
  def new; end

  def create
    ChessPiece.create(chess_piece_params)
  end

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :game_id)
  end
end
