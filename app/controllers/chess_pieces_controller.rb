# Add comments here
class ChessPiecesController < ApplicationController
  attr_accessor :current_turn

  def new; end

  def update
    @chess_piece = ChessPiece.find_by_id(params[:id])
    @game = @chess_piece.game
    return false if @game.turn_player_id != current_user.id

    if @chess_piece.move_to!([params[:x_position], params[:y_position]])
      @chess_piece.update(chess_piece_params)
      return false unless current_user.id == @chess_piece.game.turn_player_id

      next_turn = if @game.turn_player_id == @game.white_player_id
                    @game.black_player_id
                  else
                    @game.white_player_id
                  end
      @game.update_attributes(turn_player_id: next_turn)
    end

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
