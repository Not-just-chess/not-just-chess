module UsersHelper
  attr_accessor :active_games, :prev_games

  def user_active_games(user)
    @active_games = Game.all
    @active_games.reject do |game|
      (game.white_player_id != user.id || game.black_player_id != user.id) &&
        (game.winner.nil? || game.loser.nil? || game.draw.zero?)
    end
  end

  def user_prev_games(user)
    @prev_games = Game.all
    @prev_games.reject do |game|
      (game.white_player_id != user.id || game.black_player_id != user.id) &&
        (!game.winner.nil? || !game.loser.nil? || game.draw == 1)
    end
  end
end
