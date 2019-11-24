# Rook subclass
class Rook < ChessPiece
  def valid_move?(current_location, destination)
    # Rook can move horizontally and vertically without obstructions
    x1 = current_location[0]
    x2 = current_location[1]
    y1 = destination[0]
    y2 = destination[1]

    x_delta = (x2 - x1).abs
    y_delta = (y2 - y1).abs

    return true if !is_obstructed?([x1, y1], [x2, y2]) && !off_board?(x2, y2) &&
                   (x_delta >= 1 && y_delta.zero?) || (y_delta >= 1 && x_delta.zero?)

    false
  end
end
