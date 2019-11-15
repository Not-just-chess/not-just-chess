# Knight subclass
class Knight < ChessPiece
  def piece_unicode
    return y_position < 5 ? "&#9816;" : "&#9822;"  
  end
end
