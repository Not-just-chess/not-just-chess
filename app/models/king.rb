# King subclass
class King < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9812;' : '&#9818;'
  # end

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

    return false if off_board?(x2, y2)

    return true if @moves.include?(destination)
  end

  castle!(rook_x, rook_y)
    if castle_kingside?(rook_y)
      rook_kingside.update_attributes(x_position: 6, y_position: rook_y)
    end
    if castle_queenside?(rook_y)
      rook_queenside.update_attributes(x_position: 4, y_position: rook_y)
    end
    update_attributes(x_position: rook_x, y_position: rook_y)
  end

  # rook_y is just a y coordinate because the x will always have to be 1 or 8 for castling to work

  def can_castle?(rook_y)
    has_moved? == false && (castle_kingside?(rook_y) || castle_queenside?(rook_y))

    # A king cannot castle if it is in check and cannot castle if castling will put it in check.

  end

  def castle_kingside?(rook_y)
    rook_kingside.has_moved? == false && rook_kingside.is_obstructed(5, rook_y) == false
  end

  def castle_queenside?(rook_y)
    rook_queenside.has_moved? == false && rook_queenside.is_obstructed(5, rook_y) == false
  end

  def rook_kingside
    @rook_kingside = game.pieces.where(x_position: 8, y_position: y_position, color: color, type: 'Rook').first
  end

  def rook_queenside
    @rook_queenside = game.pieces.where(x_position: 1, y_position: y_position, color: color, type: 'Rook').first
  end
end
