class Pawn < ChessPiece
  attr_accessor :can_capture
  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]
    return false if off_board?(x2, y2) || y2 == y1

    # take delta/slope
    slope = ((x2 - x1) * 1.0) / ((y2 - y1) * 1.0)
    moves = []
    # White
    if color == true
      moves.push([x1, y1 + 1])
      moves.push([x1, y1 + 2]) if y1 == 2
      if slope.abs == 1
        moves.push([x1 - 1, y1 + 1])
        moves.push([x1 + 1, y1 + 1])
      end
      return false unless moves.include?([x2, y2])
    # Black
    elsif color == false
      moves.push([x1, y1 - 1])
      moves.push([x1, y1 - 2]) if y1 == 7
      if slope.abs == 1
        moves.push([x1 - 1, y1 - 1])
        moves.push([x1 + 1, y1 - 1])
      end
      return false unless moves.include?([x2, y2])
    end
    is_obstructed?([x1, y1], [x2, y2]) && slope.abs != 1
    @can_capture = true if is_obstructed?([x1, y1], [x2, y2]) && slope.abs == 1
    true
  end
end
