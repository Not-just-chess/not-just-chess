# King subclass
class King < ChessPiece
  def piece_unicode
<<<<<<< HEAD
    y_position < 5 ? '&#9812;' : '&#9818;'
=======
    y_position < 5 ? '&#x2654;' : '&#9818;'
  end

  def valid_move?(current_location, destination)
    @moves = [
      [1, 1],
      [1, 0],
      [1, -1],
      [0, 1],
      [0, -1],
      [-1, 1],
      [-1, 0],
      [-1, -1]
    ]

    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    @moves.each do |move|
      move[0] += x1
      move[1] += y1
    end

    # This can be replaced with a method that checks if the board array contains the value

    return false if x2.negative? || x2 > 7 || y2.negative? || y2 > 7

    return true if @moves.include?(destination) && @game[x2, y2] == false
>>>>>>> a6c335adcacfbd816c311207c4f5f18b0e268b0b
  end
end
