# Knight subclass
class Knight < ChessPiece
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
    return false if x2 == x_position && y2 == y_position

    unless x_position.nil?
      @moves.each do |move|
        move[0] += x_position
        move[1] += y_position
      end
    end

    return false if off_board?(x2, y2)

    return true if @moves.include?([x2, y2])
  end
end
