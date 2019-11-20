class Bishop < ChessPiece
  def valid_move?(current_location, destination)
    # Bishop can move any number of spaces
    # as long as moves are diagonal

    # current x_position and y_position
    x1 = current_location[0]
    y1 = current_location[1]

    # destination_x and destination_y
    x2 = destination[0]
    y2 = destination[1]

    # take delta/slope
    x_delta = x2 - x1
    y_delta = y2 - y1
    slope = y_delta / x_delta

    # abs value of slope should always equal 1
    if slope.abs == 1
      if !is_obstructed?(current_location, destination)
        return false if (x < 1 || x > 8) || (y < 1 || y > 8)
      else
        false
      end
    else
      false
    end
  end
end
