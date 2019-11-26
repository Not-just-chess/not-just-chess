# Pawn subclass
class Pawn < ChessPiece
  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    return false if off_board?(x2, y2)

    moves = []

    # White
    if color == true
      moves.push([x1, y1 + 1])
      moves.push([x1 - 1, y1 + 1])
      moves.push([x1 + 1, y1 + 1])
      moves.push([x1, y1 + 2]) if y1 == 2
    # Black
    elsif color == false
      moves.push([x1, y1 - 1])
      moves.push([x1 - 1, y1 - 1])
      moves.push([x1 + 1, y1 - 1])
      moves.push([x1, y1 - 2]) if y_position == 7
    end
    moves.include?([x2, y2])
  end
end
