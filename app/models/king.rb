# King subclass
class King < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9812;' : '&#9818;'
  # end


  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    x_delta = (x2 - x1).abs
    y_delta = (y2 - y1).abs


    return true if (x_delta <= 1) && (y_delta <= 1)
    # return true if can_castle?

    return false if off_board?(x2, y2)
    
  end
end
