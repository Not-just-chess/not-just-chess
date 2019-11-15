# Rook subclass
class Rook < ChessPiece
  def piece_unicode
    y_position < 5 ? '&#9814;' : '&#9820;'
  end
end
