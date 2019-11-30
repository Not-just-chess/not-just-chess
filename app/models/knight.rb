# Knight subclass
class Knight < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9816;' : '&#9822;'
  # end

  def valid_move?(destination)
    @moves = [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]

    x2 = destination[0].to_i
    y2 = destination[1].to_i

    @moves.each do |move|
      move[0] += x_position
      move[1] += y_position
    end

    return false if off_board?(x2, y2)

    return true if @moves.include?(destination)
  end
end
