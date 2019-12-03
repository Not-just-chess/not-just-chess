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


    return false if off_board?(x2, y2) || is_obstructed?(destination)

    return true if @moves.include?([x2, y2])

    return true if can_castle?(x2, y2)
  end

  def rook_kingside
    @rook_kingside = ChessPiece.where(game_id: game_id, x_position: 8, color: color, type: 'Rook').first
  end

  def rook_queenside
    @rook_queenside = ChessPiece.where(game_id: game_id, x_position: 1, color: color, type: 'Rook').first
  end

  def can_castle?(x_destination, y_destination)
    has_moved == false && (castle_kingside?(x_destination,y_destination) || castle_queenside?(x_destination,y_destination))
    # A king cannot castle if it is in check and cannot castle if castling will put it in check or if it is currently in check
  end

  def castle_kingside?(x_destination, y_destination)
    return true if x_destination == 7 && y_destination == y_position && rook_kingside.has_moved == false && rook_kingside.is_obstructed?([5, y_destination]) == false
  end

  def castle_queenside?(x_destination,y_destination)
    return true if x_destination == 3 && y_destination == y_position && rook_queenside.has_moved == false && rook_queenside.is_obstructed?([5, y_destination]) == false
  end

  def castle!(x_destination, y_destination)
    if castle_kingside?(x_destination, y_destination)
      rook_kingside.update_attributes(x_position: 6, y_position: y_destination)
    end
    if castle_queenside?(x_destination, y_destination)
      rook_queenside.update_attributes(x_position: 4, y_position: y_destination)
    end
    update_attributes(x_position: x_destination, y_position: y_destination)
  end

  def move_to!(destination)
    x2 = destination[0].to_i
    y2 = destination[1].to_i
    castle!(x2, y2) if can_castle?(x2,y2)
    super(destination)
  end
end
