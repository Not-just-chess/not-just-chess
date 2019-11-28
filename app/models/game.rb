class Game < ApplicationRecord
  has_many :chess_pieces
  belongs_to :user
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
  scope :available, -> { where(black_player_id: nil) }

  def populate_game
    @game = Game.last

    ## Initiates White Pieces
    x = 0
    8.times do
      x += 1
      y = 2
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: true, htmlcode: '&#x2659;')
    end

    Rook.create(game_id: @game.id, y_position: 1, x_position: 1, color: true, htmlcode: '&#9814;')
    Rook.create(game_id: @game.id, y_position: 1, x_position: 8, color: true, htmlcode: '&#9814;')
    Knight.create(game_id: @game.id, y_position: 1, x_position: 2, color: true, htmlcode: '&#9816;')
    Knight.create(game_id: @game.id, y_position: 1, x_position: 7, color: true, htmlcode: '&#9816;')
    Bishop.create(game_id: @game.id, y_position: 1, x_position: 3, color: true, htmlcode: '&#9815;')
    Bishop.create(game_id: @game.id, y_position: 1, x_position: 6, color: true, htmlcode: '&#9815;')
    Queen.create(game_id: @game.id, y_position: 1, x_position: 4, color: true, htmlcode: '&#9813;')
    King.create(game_id: @game.id, y_position: 1, x_position: 5, color: true, htmlcode: '&#9812;')

    ## Initiates Black Pieces
    x = 0
    8.times do
      x += 1
      y = 7
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: false, htmlcode: '&#x265F;')
    end

    Rook.create(game_id: @game.id, y_position: 8, x_position: 1, color: false, htmlcode: '&#9820;')
    Rook.create(game_id: @game.id, y_position: 8, x_position: 8, color: false, htmlcode: '&#9820;')
    Knight.create(game_id: @game.id, y_position: 8, x_position: 2, color: false, htmlcode: '&#9822;')
    Knight.create(game_id: @game.id, y_position: 8, x_position: 7, color: false, htmlcode: '&#9822;')
    Bishop.create(game_id: @game.id, y_position: 8, x_position: 3, color: false, htmlcode: '&#9821;')
    Bishop.create(game_id: @game.id, y_position: 8, x_position: 6, color: false, htmlcode: '&#9821;')
    Queen.create(game_id: @game.id, y_position: 8, x_position: 4, color: false, htmlcode: '&#9819;')
    King.create(game_id: @game.id, y_position: 8, x_position: 5, color: false, htmlcode: '&#9818;')
  end

  def in_check?(color)
    king = ChessPiece.find_by(type: 'King', color: true)
    ChessPiece.where(game_id: @game.id, color: false).find_each do |chess_piece|
      return true if chess_piece.valid_move?(king.x_position, king.y_position)
    end
    false
  end
end
