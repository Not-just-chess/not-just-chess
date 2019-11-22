# Rook subclass
class Rook < ChessPiece
  def valid_move?(new_x, new_y)
    # Rook can only move horizontally and vertically

    x_delta = (new_x - x_position).abs
    y_delta = (new_y - y_position).abs

    return true if (x_delta >= 1 && y_delta.zero?) || (y_delta >= 1 && x_delta.zero?) && !off_board?(new_x, new_y)
  else
    false
  end
end
