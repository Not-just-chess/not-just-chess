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
end
