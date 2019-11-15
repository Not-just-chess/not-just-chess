# Rook subclass
class Rook < ChessPiece
  def piece_unicode
    return y_position < 5 ? "&#9814;" : "&#9820;"
  end
end
