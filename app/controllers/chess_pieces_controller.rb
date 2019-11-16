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

<<<<<<< HEAD
  def update
    @chess_piece = ChessPiece.find_by_id(params[:id])
    @game = @chess_piece.game
    @chess_piece.update_attributes(data-x_position: 4, data-y_position: 4)
    redirect_to game_path(@game.id)
  end

  private

=======
>>>>>>> a6c335adcacfbd816c311207c4f5f18b0e268b0b
  def chess_piece_params
    params.require(:chess_piece).permit(:type, :game_id, :x_position, :y_position, :color)
  end
end
