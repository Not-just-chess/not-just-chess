# Bishop subclass
class Bishop < ChessPiece
  def piece_unicode  
    return y_position < 5 ? "&#9815;" : "&#9821;"
  end
end
