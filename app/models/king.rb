# King subclass
class King < ChessPiece
  def piece_unicode
    y_position < 5 ? '&#9812;' : '&#9818;'
  end
end
