# Add comment here
class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil).or.where(white_player_id: nil) }
end
