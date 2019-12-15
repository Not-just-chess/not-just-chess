class MessagesController < ApplicationController
before_action :authenticate_user!


def create

@message= current_game.messages.create(message_params.merge(user_id: current_user))

render json: @message

end

private 

def message_params
params.require(:message).permit(:content, :game_id, :user_id, :id)
end

helper_method :current_game
def current_game
@current_game ||= Game.find(params[:game_id])
end

end
