# Rook subclass
class Rook < ChessPiece
  def valid_move?(destination)
    # Rook can move horizontally and vertically without obstructions
    x2 = destination[0].to_i
    y2 = destination[1].to_i
    return false if x2 == x_position && y2 == y_position

    x_delta = (x2 - x_position).abs
    y_delta = (y2 - y_position).abs

    return true if !is_obstructed?([x2, y2]) && !off_board?(x2, y2) &&
                   ((x_delta >= 1 && y_delta.zero?) || (y_delta >= 1 && x_delta.zero?))

    false
  end
end
