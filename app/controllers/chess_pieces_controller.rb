# Add comments here
class ChessPiecesController < ApplicationController
  def new; end

  def update
    ## actions I want to take
    ## locate piece to move
    ## locate new destination
    ## run move_to! method that will check for a valid move and if new space is empty or occupied and checks for capturing piece
    ## Send user back to show page with piece moved and captured piece of the board

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
