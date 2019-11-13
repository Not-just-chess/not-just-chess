# Game model
class Game < ApplicationRecord
  has_many :chess_pieces
  belongs_to :user
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
  scope :available, -> { where(black_player_id: nil).or.where(white_player_id: nil) }

  def is_obstructed(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]
    
    x_delta = x2 - x1
    y_delta = y2 - y1
    x_dir = x_delta/(x_delta.abs)
    y_dir = y_delta/(y_delta.abs)

    x_move = x1
    y_move = y1

    while x_move != x2 || y_move != y2
      x_move = x1 + x_dir
      y_move = y1 + y_dir

      if @rows[x_move][y_move] 
        return true
      end
    end
  end
  
end
