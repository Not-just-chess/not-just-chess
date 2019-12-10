module UsersHelper
  attr_accessor :active_games, :prev_games

  def user_active_games(user)
    games = Game.all
    @active_games = games.reject do |game|
      (game.white_player_id != user.id || game.black_player_id != user.id) &&
        (!game.loser.nil? || game.draw || game.forfeited)
    end
  end

  def user_prev_games(user)
    games = Game.all
    @prev_games = games.reject do |game|
      (game.white_player_id != user.id || game.black_player_id != user.id) &&
        (!game.draw && !game.forfeited && game.loser.nil?)
    end
  end
end