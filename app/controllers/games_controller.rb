# Games Controller
class GamesController < ApplicationController
  def new; end

  def create; end

  def show
    @game = Game.find_by_id(params[:id])
    return render_not_found if @game.blank?
  end

  def index; end
end
