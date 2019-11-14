class Game < ApplicationRecord
  has_many :chess_pieces
  belongs_to :user
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
  scope :available, -> { where(black_player_id: nil) }

  def populate_game
    x = 0
    y = 0
    
    # first need to initialize the chess pieces
    y = 1
    x += 1
    Rook.create(game_id: @game.id, y_position: y, x_position: x)
    x += 1
    Knight.create(game_id: @game.id, y_position: y, x_position: x)
    x += 1
    Bishop.create(game_id: @game.id, y_position: y, x_position: x)
    x += 1
    King.create(game_id: @game.id, y_position: y, x_position: x)

    8.times do
      x += 1
      y = 2
      Pawn.create(game_id: @game.id, y_position: y, x_position: x)
    end

    while x <= 8 do
      x = x+1
      Queen.create(chess_piece_params)

      Bishop.create(chess_piece_params)

      Knight.create(chess_piece_params)

      Rook.create(chess_piece_params)

      8.times do
      Pawn.create(chess_piece_params)
        set y=2
        while x <= 8  
          set x= x+1
        end
      end
    end
  end  

  def populate_game
    x = 0 
    y = 0

    ## Initiates White Pieces
    8.times do
      x += 1
      y = 2
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: false)
    end

    Rook.create(game_id: @game.id, y_position: 0, x_position: 0, color: false)
    Rook.create(game_id: @game.id, y_position: 0, x_position: 7, color: false)
    Knight.create(game_id: @game.id, y_position: 0, x_position: 1, color: false)
    Knight.create(game_id: @game.id, y_position: 0, x_position: 6, color: false)
    Bishop.create(game_id: @game.id, y_position: 0, x_position: 2, color: false)
    Bishop.create(game_id: @game.id, y_position: 0, x_position: 5, color: false)
    Queen.create(game_id: @game.id, y_position: 0, x_position: 3, color: false)
    King.create(game_id: @game.id, y_position: 0, x_position: 4, color: false)

    ## Initiates Black Pieces
    8.times do
      x += 1
      y = 6
      Pawn.create(game_id: @game.id, y_position: y, x_position: x, color: true)
    end

    Rook.create(game_id: @game.id, y_position: 7, x_position: 0, color: true)
    Rook.create(game_id: @game.id, y_position: 7, x_position: 7, color: true)
    Knight.create(game_id: @game.id, y_position: 7, x_position: 1, color: true)
    Knight.create(game_id: @game.id, y_position: 7, x_position: 6, color: true)
    Bishop.create(game_id: @game.id, y_position: 7, x_position: 2, color: true)
    Bishop.create(game_id: @game.id, y_position: 7, x_position: 5, color: true)
    Queen.create(game_id: @game.id, y_position: 7, x_position: 3, color: true)
    King.create(game_id: @game.id, y_position: 7, x_position: 4, color: true)

end
