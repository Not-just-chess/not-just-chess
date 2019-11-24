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

    # verify that destination is on the board
    !off_board?(x2, y2)

    # take delta/slope
    x_delta = (x2 - x1) * 1.0
    y_delta = (y2 - y1) * 1.0
    slope = y_delta / x_delta

    # abs value of slope should always equal 1
    # check if move is obstructed
    is_obstructed?([x1, y1], [x2, y2])
    slope.abs == 1
  end
end
