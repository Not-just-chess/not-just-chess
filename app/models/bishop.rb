# Bishop subclass
class Bishop < ChessPiece
  def piece_unicode
    y_position < 5 ? '&#9815;' : '&#9821;'
  end
end
