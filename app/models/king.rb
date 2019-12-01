# King subclass
class King < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9812;' : '&#9818;'
  # end

  def valid_move?(destination)
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

    x2 = destination[0].to_i
    y2 = destination[1].to_i

    @moves.each do |move|
      move[0] += x_position
      move[1] += y_position
    end

    # This can be replaced with a method that checks if the board array contains the value

    return false if off_board?(x2, y2)

    return true if @moves.include?([x2, y2])
  end
end
