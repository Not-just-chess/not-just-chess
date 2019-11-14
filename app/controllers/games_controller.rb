# Games Controller
class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    @game.update_attributes(white_player_id: current_user.id)
    # populate_game
    redirect_to game_path(@game.id)
  end

  def show
    @game = Game.find_by_id(params[:id])
    return render_not_found if @game.blank?
  end

  def index
    @games = Game.available
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(black_player_id: current_user.id)
    redirect_to game_path(@game.id)
  end

  private

  def game_params
    params.permit(:user)
  end
end
