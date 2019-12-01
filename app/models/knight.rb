# Knight subclass
class Knight < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9816;' : '&#9822;'
  # end


  def valid_move?(current_location, destination)
    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    return false if off_board?(x2, y2)

    x_delta = (x2 - x1).abs
    y_delta = (y2 - y1).abs

    if ((x_delta == 2) && (y_delta == 1))
      return true

    end

    if ((x_delta == 1) && (y_delta == 2))
      return true
    end


    return false

  end
end
