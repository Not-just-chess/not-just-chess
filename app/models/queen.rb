# Queen subclass
class Queen < ChessPiece
  def valid_move?(destination)
    x2 = destination[0].to_i
    y2 = destination[1].to_i

    y_delta = (y2 - y_position)
    x_delta = (x2 - x_position)

    slope = y_delta.abs == x_delta.abs ? 1 : 0


    # Check if the destination location is of off the board
    off_board?(x2, y2)

    # Vertical Check || Horizontal Check || Diagonal Check
    return false unless y_position == y2 || x_position == x2 || slope == 1

    return false if is_obstructed?(destination)

    true
  end
end
