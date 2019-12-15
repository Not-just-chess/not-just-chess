class Bishop < ChessPiece
  def valid_move?(destination)
    # Bishop can move any number of spaces
    # as long as moves are diagonal

    # destination_x and destination_y
    x2 = destination[0].to_i
    y2 = destination[1].to_i
    return false if x2 == x_position && y2 == y_position

    # verify that destination is on the board
    return false if off_board?(x2, y2)

    # take delta/slope
    x_delta = (x2 - x_position) * 1.0
    y_delta = (y2 - y_position) * 1.0
    slope = y_delta / x_delta

    # abs value of slope should always equal 1
    # check if move is obstructed
    return false if is_obstructed?(destination)

    slope.abs == 1
  end
end
