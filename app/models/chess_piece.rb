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
    space = @game[new_x][new_y]

    test1 = ChessPiece.where(x_postion: new_x, y_position: new_y)

    if space.nil?
      update_attributes(x_position: new_x, y_position: new_y)
      return true
    end

    if color != space.color
      update_attributes(x_position: new_x, y_position: new_y)
      space.update_attributes(x_position: nil, y_position: nil)
      return true
    else
      return false
    end
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

    while x_move != x2 || y_move != y2
      x_move = x1 + x_dir
      y_move = y1 + y_dir

      return true if @game[x_move][y_move]
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
end
