# Add comments here
class ChessPiecesController < ApplicationController
  def new; end

  def update
    @chess_piece = ChessPiece.find_by_id(params[:id])

    @chess_piece.update(chess_piece_params) if @chess_piece.move_to!([params[:x_position], params[:y_position]])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @chess_piece, status: :ok }
    end
  end

  private

  def chess_piece_params
    params.permit(:x_position, :y_position, :game_id, :id, :type, :color, :captured, :htmlcode)
  end
end
