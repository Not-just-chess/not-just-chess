# King subclass
class King < ChessPiece
  # def piece_unicode
  #  y_position < 5 ? '&#9812;' : '&#9818;'
  # end

  def valid_move?(current_location, destination)
    x2 = destination[0].to_i
    y2 = destination[1].to_i

    x_delta = (x2 - x_position).abs
    y_delta = (y2 - y_position).abs

    return true if (x_delta <= 1) && (y_delta <= 1) && !off_board?(x2, y2)
    # return true if can_castle?
  end
end
