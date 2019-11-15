# King subclass
class King < ChessPiece
  def piece_unicode
    return y_position < 5 ? "&#x2654;" : "&#9818;"
  end
end
