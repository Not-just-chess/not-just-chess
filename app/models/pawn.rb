# Pawn subclass
class Pawn < ChessPiece
  def piece_unicode
    y_position < 5 ? '&#9817;' : '&#9823;'
  end
end
