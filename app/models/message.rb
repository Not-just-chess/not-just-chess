class Message < ApplicationRecord
after_create :send_to_firebase
belongs_to :game
has_one :user, through: :game

def send_to_firebase
FIREBASE.push("games/"+self.game.id.to_s + "/messages/", {id: self.id, content: self.content, user_id: self.user.id, game_id: self.game_id })
	end

end
