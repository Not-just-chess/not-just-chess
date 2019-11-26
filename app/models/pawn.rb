class Pawn < ChessPiece
  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]
    return false if off_board?(x2, y2)

    moves = []
    if is_obstructed?([x1, y1], [x2, y2])
      # White
      if color == true
        moves.push([x1 - 1, y1 + 1])
        moves.push([x1 + 1, y1 + 1])
      # Black
      elsif color == false
        moves.push([x1 - 1, y1 - 1])
        moves.push([x1 + 1, y1 - 1])
      end
      moves.include?([x2, y2])
    else
      # White
      if color == true
        moves.push([x1, y1 + 1])
        if y_position == 2
          moves.push([x1, y1 + 2])
          moves.push([x1, y1 + 1])
        end
      # Black
      elsif color == false
        moves.push([x1, y1 - 1])
        if y_position == 7
          moves.push([x1, y1 - 2])
          moves.push([x1, y1 - 1])
        end
      end
    end
    moves.include?([x2, y2])
  end
end
