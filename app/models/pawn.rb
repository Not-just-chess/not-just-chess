class Pawn < ChessPiece
  attr_accessor :can_capture
  def valid_move?(destination)
    x2 = destination[0]
    y2 = destination[1]
    return false if off_board?(x2, y2) || y2 == y_position

    # take delta/slope
    slope = ((x2 - x_position) * 1.0) / ((y2 - y_position) * 1.0)
    moves = []
    # White
    if color == true
      moves.push([x_position, y_position + 1])
      moves.push([x_position, y_position + 2]) if y_position == 2
      if slope.abs == 1
        moves.push([x_position - 1, y_position + 1])
        moves.push([x_position + 1, y_position + 1])
      end
      return false unless moves.include?([x2, y2])
    # Black
    elsif color == false
      moves.push([x_position, y_position - 1])
      moves.push([x_position, y_position - 2]) if y_position == 7
      if slope.abs == 1
        moves.push([x_position - 1, y_position - 1])
        moves.push([x_position + 1, y_position - 1])
      end
      return false unless moves.include?([x2, y2])
    end
    is_obstructed?([x2, y2]) && slope.abs != 1
    @can_capture = true if is_obstructed?([x2, y2]) && slope.abs == 1
    true
  end
end
