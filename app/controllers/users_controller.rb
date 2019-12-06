class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end
