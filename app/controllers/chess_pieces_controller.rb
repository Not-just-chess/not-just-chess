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
    params[:y_position]
    params[:x_position]

    @chess_piece.update(chess_piece_params)

    redirect_to game_path(@chess_piece.game_id)
  end

  #def update ## second version to include move_to! method

    ## actions I want to take
    ## locate piece to move
    ## locate new destination
    ## run move_to! method that will check for a valid move and if new space is empty or occupied and checks for capturing piece
    ## Send user back to show page with piece moved and captured piece of the board

   # @chess_piece = ChessPiece.find_by_id(params[:id])
    
    #@chess_piece.move_to([params[:x_position], params[:y_position]])
    ## flash notice where not valid 

    #@chess_piece.update(chess_piece_params)

    #redirect_to game_path(@chess_piece.game_id)
  #end

  private

  def chess_piece_params
    params.permit(:x_position, :y_position)
  end
end
