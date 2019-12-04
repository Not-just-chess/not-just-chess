# Games Helper
module GamesHelper
  attr_accessor :pieces, :current_player

  def render_piece(game)
    @pieces = ChessPiece.where(game_id: game.id)
  end

  def current_user
    @current_player = current_user
  end
end
