# Queen subclass
class Queen < ChessPiece

  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    y_delta = (y2 - y1)
    x_delta = (x2 - x1)
    
    if y_delta == 0 || x_delta == 0
      slope = 0
    else
      slope = y_delta.abs / x_delta.abs
    end

    # Check if the destination location is of off the board
    return false if off_board?(x2, y2)

    # Vertical Check || Horizontal Check || Diagonal Check
    return false unless y1 == y2 || x1 == x2 || slope == 1
    return false if is_obstructed?([x1,y1], [x2,y2])
  end
end
