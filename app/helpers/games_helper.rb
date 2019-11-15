# Games Helper
module GamesHelper
  attr_accessor :pieces
  
  def render_piece(game)
    @pieces = ChessPiece.where(game_id: game.id)
  end
end