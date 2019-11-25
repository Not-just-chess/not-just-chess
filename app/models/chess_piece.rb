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

    if space.nil?
      update_attributes(x_position: new_x, y_position: new_y)
      return true
    end

    if space.color != color
      capture_piece(new_x, new_y)
      update_attributes(x_position: new_x, y_position: new_y)
      true
    else
      false
    end
  end

  def find_piece(x_position, y_position)
    ChessPiece.where(game_id: game.id, x_position: x_position, y_position: y_position)
  end

  def capture_piece(x_position, y_position)
    target = find_piece(x_position, y_position)
    target.update_attributes(captured: true, x_position: nil, y_position: nil)
  end

  def is_obstructed?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    x_delta = x2 - x1
    y_delta = y2 - y1
    x_dir = x_delta.zero? ? 0 : x_delta / x_delta.abs
    y_dir = y_delta.zero? ? 0 : y_delta / y_delta.abs

    x_move = x1
    y_move = y1

    while x_move <= x2 || y_move <= y2
      x_move = x1 + x_dir
      y_move = y1 + y_dir

      blocker = ChessPiece.where(game_id: game.id, x_position: x_move, y_position: y_move, captured: nil).count
      return false if blocker.zero?

      return true
    end
  end

  def selected(piece, chess_piece)
    'selected' if piece == chess_piece
  end

  def board_color(col, row)
    if (col + row).odd?
      'white'
    else
      'black'
    end
  end

  def off_board?(new_x, new_y)
    (new_x < 1 || new_x > 8) || (new_y < 1 || new_y > 8)
  end
end
