class StaticPageController < ApplicationController
  def index
    @games = Game.available
  end
end
