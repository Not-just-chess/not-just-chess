class Game < ApplicationRecord
  has_many :chess_pieces
  belongs_to :user
  delegate :kings, :queens, :knights, :rooks, :bishops, :pawns, to: :chess_pieces
  scope :available, -> { where(black_player_id: nil) }
  scope :active, -> { where(forfeited: false) }

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
    king = chess_pieces.find_by(type: 'King', color: color)
    king_x = king.x_position
    king_y = king.y_position
    destination = [king_x, king_y]
    active_pieces = chess_pieces.reject { |cp| cp.x_position.nil? }
    active_pieces = active_pieces.reject { |cp| cp.color == color }
    @capturing_piece = active_pieces.find { |cp| cp.valid_move?(destination) }
    Rails.logger.debug(@capturing_piece.inspect)
    
    return @capturing_piece
  end

  def checkmate?(color)
    if in_check?(color)
      king = chess_pieces.find_by(type: 'King', color: color)
      # If the king can move out of it, return false
      # @moves = [ [1, 1], [1, 0], [1, -1], [0, 1], [0, -1], [-1, 1], [-1, 0], [-1, -1] ]
      # @moves.each do |move|
      #   return false if king.move_to!([x_position, y_position] + move) === true
      # end
      # If the attacking piece can be obstructed, return false
      # return false if capturing_piece.can_be_obstructed?([king.x_position, king.y_position])
      # If the attacking piece can be captured, return false
      king_x = king.x_position
      king_y = king.y_position
      destination = [king_x, king_y]
      active_pieces = chess_pieces.reject { |cp| cp.x_position.nil? }
      active_pieces = active_pieces.reject { |cp| cp.color == color }
      @capturing_piece = active_pieces.find { |cp| cp.valid_move?(destination) }
      return !@capturing_piece.can_be_captured?
    end
  end

  def stalemate_check
    #####  part 1
    # find active pieces
    # check to see if there are any possible moves for user

    ##### part 2
    # hypothetical of IF you move the pieces to one of those spaces
    # plug those moves into in_check?(color_to_check)
    # start with pieces with limited moves (i.e. pawns, knights, etc.)
    color_to_check = turn_player_id == white_player_id
    pieces_to_check = chess_pieces.active.select { |cp| cp.color == color_to_check }
    pieces_to_check.each do |_piece|
      # this leave us with only having to check valid moves on
      in_check?(color_to_check)
    end
  end

  def forfeit_game(forfeiting_user)
    if forfeiting_user.id == white_player_id
      update_attributes(forfeited: true, winner: black_player_id, loser: white_player_id)
    elsif forfeiting_user.id == black_player_id
      update_attributes(forfeited: true, winner: white_player_id, loser: black_player_id)
    end
  end
end
