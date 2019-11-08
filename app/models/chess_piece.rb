# Create ChessPiece parent model
class ChessPiece < ApplicationRecord
  belongs_to :game

  def self.types
    %w[King Queen Rook Knight Bishop Pawn]
  end

  scope :kings, -> { where(type: 'King') }
  scope :queens, -> { where(type: 'Queen') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :pawns, -> { where(type: 'Pawn') }
end
