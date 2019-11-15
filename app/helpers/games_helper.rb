# Games Helper
module GamesHelper
  attr_accessor :x, :y, :type, :pieces
  
  def render_piece(game)
    @pieces = ChessPiece.where(game_id: game.id)

    @pieces.each do |piece|
      @x = piece.x_position
      @y = piece.y_position
      @type = piece.type
    end
  end
end
