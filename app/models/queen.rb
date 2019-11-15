# Queen subclass
class Queen < ChessPiece
  def piece_unicode  
    return y_position < 5 ? "&#9813;" : "&#9819;"
  end
end
