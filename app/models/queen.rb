# Queen subclass
class Queen < ChessPiece
  def valid_move?(destination)
    x2 = destination[0].to_i
    y2 = destination[1].to_i
    return false if x2 == x_position && y2 == y_position

    y_delta = (y2 - y_position)
    x_delta = (x2 - x_position)

    slope = if y_delta.zero? || x_delta.zero?
              0
            else
              y_delta.abs / x_delta.abs
            end

    # Check if the destination location is of off the board
    off_board?(x2, y2)

    # Vertical Check || Horizontal Check || Diagonal Check
    return false unless y_position == y2 || x_position == x2 || slope == 1

    return false if is_obstructed?(destination)

    true
  end
end
