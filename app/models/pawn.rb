# Pawn subclass
class Pawn < ChessPiece
  # Can move only forward
  # Move 1 at a time except on its first move
  # Captures diagonally

  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    @moves_white = [
      [0, 1],
      [0, 2]
    ]

    @moves_black = [
      [0, -1],
      [0, -2]
    ]

    @moves_white.each do |move|
      move[0] += x1
      move[1] += y1
    end

    @moves_black.each do |move|
      move[0] += x1
      move[1] += y1
    end

    # first if, checking for initial position to determine valid 2-space move
    if (color == true && y_position == 2) || (color == false && y_position == 7)
      # checks if the 2-space move requested works
      return true if (color == true && @moves_white.include?(destination)) || (color == false && @moves_black.include?(destination))
    else
      # if not on its first move, checks that moves are 1-space
      return true if (color == true && x2 == x1 + 1) || (color == false && x2 == x1 + 1)
    end

    is_obstructed?([x1, y1], [x2, y2])
  end
end
