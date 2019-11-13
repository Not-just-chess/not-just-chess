# Games Controller
class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    populate_game
    redirect_to root_path
  end

  def show
    @game = Game.find_by_id(params[:id])
    return render_not_found if @game.blank?
  end

  def index; end

  def update
    @game = Game.find(params[:id])

    @game.update_attributes(game_params)
    if @game.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.permit(:user)
  end
end
