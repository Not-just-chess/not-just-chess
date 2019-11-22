# Queen subclass
class Queen < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9813;' : '&#9819;'
  # end

  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    y_delta = (y2 - y1)
    x_delta = (x2 - x1)
    slope = y_delta / x_delta

    # Check if the destination location is of off the board
    return false if x2.negative? || x2 > 7 || y2.negative? || y2 > 7

    # Vertical Check || Horizontal Check || Diagonal Check
    return false unless y1 == y2 || x1 == x2 || slope == 1
    return false if ChessPiece.isobstructed?
  end
end
