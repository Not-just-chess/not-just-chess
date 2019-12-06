# Games Helper
module GamesHelper
  attr_accessor :pieces, :white_player, :black_player, :turn_player

  def render_piece(game)
    @pieces = ChessPiece.where(game_id: game.id)
  end

  def players(game)
    @white_player = User.where(id: game.white_player_id).first
    @black_player = User.where(id: game.black_player_id).first
    @turn_player = User.where(id: game.turn_player_id).first
  end
end
