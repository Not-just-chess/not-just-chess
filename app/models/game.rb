class Game < ApplicationRecord
  has_many :chess_pieces
  belongs_to :user
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
  scope :available, -> { where(black_player_id: nil).or.where(white_player_id: nil) }

  def populate_game
    # first need to initialize the chess pieces
    # then need to place pieces according to board setup
    # lastly need to either default color by placement on board, or have separate method called to do so
  end
end
