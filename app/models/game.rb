# Add comments here
class Game < ApplicationRecord
  has_many :chess_pieces
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
end
