# Add comments here
class ChessPiecesController < ApplicationController
  def new; end

  def create
    ChessPiece.create(chess_piece_params)
  end

  def show
    @chess_piece = ChessPiece.find_by_id(params[:id])
    @game = @chess_piece.game
    @chess_pieces = @game.chess_pieces
  end

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :game_id)
  end
end
