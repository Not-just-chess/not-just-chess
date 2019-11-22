# Queen subclass
class Queen < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9813;' : '&#9819;'
  # end

  def valid_move?(current_location, destination)

    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]

    y_delta = (y2 - y1)
    x_delta = (x2 - x1) 
    slope = y_delta/x_delta

    if y1 == y2 || x1 == x2 || slope == 1 

      if ChessPiece.isobstructed?
        return false
      else  
        return true
      end
    end
  end
end
