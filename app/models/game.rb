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
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: true)
    end

    Rook.create(game_id: @game.id, y_position: 1, x_position: 1, color: true)
    Rook.create(game_id: @game.id, y_position: 1, x_position: 8, color: true)
    Knight.create(game_id: @game.id, y_position: 1, x_position: 2, color: true)
    Knight.create(game_id: @game.id, y_position: 1, x_position: 7, color: true)
    Bishop.create(game_id: @game.id, y_position: 1, x_position: 3, color: true)
    Bishop.create(game_id: @game.id, y_position: 1, x_position: 6, color: true)
    Queen.create(game_id: @game.id, y_position: 1, x_position: 4, color: true)
    King.create(game_id: @game.id, y_position: 1, x_position: 5, color: true)

    ## Initiates Black Pieces
    x = 0
    8.times do
      x += 1
      y = 7
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: false)
    end

    Rook.create(game_id: @game.id, y_position: 8, x_position: 1, color: false)
    Rook.create(game_id: @game.id, y_position: 8, x_position: 8, color: false)
    Knight.create(game_id: @game.id, y_position: 8, x_position: 2, color: false)
    Knight.create(game_id: @game.id, y_position: 8, x_position: 7, color: false)
    Bishop.create(game_id: @game.id, y_position: 8, x_position: 3, color: false)
    Bishop.create(game_id: @game.id, y_position: 8, x_position: 6, color: false)
    Queen.create(game_id: @game.id, y_position: 8, x_position: 4, color: false)
    King.create(game_id: @game.id, y_position: 8, x_position: 5, color: false)
  end
end
