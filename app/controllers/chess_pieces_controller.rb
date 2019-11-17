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

  def update
    @chess_piece = ChessPiece.find_by_id(params[:id])
    x_position = params[:x_position]
    y_position = params[:y_position]

    @chess_piece.update_attributes(chess_piece_params)
    redirect_to game_path(@chess_piece.game.id)
  end

  private

  def chess_piece_params
    params.permit(:type, :game_id, :x_position, :y_position, :color)
  end
end
