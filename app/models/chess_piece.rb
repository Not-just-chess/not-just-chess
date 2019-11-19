# Create ChessPiece parent model
class ChessPiece < ApplicationRecord
  belongs_to :game

  def self.types
    %w[King Queen Rook Knight Bishop Pawn]
  end

  scope :kings, -> { where(type: 'King') }
  scope :queens, -> { where(type: 'Queen') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :pawns, -> { where(type: 'Pawn') }

  def move_to!(new_x, new_y)

    
    space = find_piece(new_x, new_y)

    if space === nil
      self.update_attributes({ x_position: new_x, y_position: new_y })
      return true
    end

    if space.color != self.color
      capture_piece(new_x, new_y)
      self.update_attributes({ x_position: new_x, y_position: new_y })
      true
    else
      false
    end

  end

  def find_piece(x, y)
    return ChessPiece.where(game_id: game_id, x_position: x, y_position: y).first
  end

  def capture_piece(x, y)
    target = find_piece(x, y)
    target.update_attributes(captured: true, x_position: nil, y_position: nil)
  end

  def is_obstructed?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    x_delta = x2 - x1
    y_delta = y2 - y1
    x_dir = x_delta / x_delta.abs
    y_dir = y_delta / y_delta.abs

    x_move = x1
    y_move = y1

    while x_move != x2 || y_move != y2
      x_move = x1 + x_dir
      y_move = y1 + y_dir

      return true if @game[x_move][y_move]
    end
  end
end
