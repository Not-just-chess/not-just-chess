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
  scope :active, -> { where(captured: nil) }

  def move_to!(destination)
    # x1 = x_position
    # y1 = y_position

    x2 = destination[0].to_i
    y2 = destination[1].to_i
    space = find_piece(x2, y2).first
    return false unless valid_move?(destination)

    return false if move_causes_check?(destination)

    return true if move_piece(x2, y2, space)

    false
  end

  def move_piece(x_dest, y_dest, space = nil)
    if space.nil?
      update_attributes(x_position: x_dest, y_position: y_dest, has_moved: true)
    elsif space.color != color
      update_attributes(x_position: x_dest, y_position: y_dest, has_moved: true)
      space.capture_piece(x_dest, y_dest)
    else
      return false
    end
    true
  end

  def find_piece(x_position, y_position)
    ChessPiece.where(game_id: game_id, x_position: x_position, y_position: y_position)
  end

  def capture_piece(x_position, y_position)
    target = if color == true
               find_piece(x_position, y_position).first
             else
               find_piece(x_position, y_position).last
             end
    target.update_attributes(captured: true, x_position: nil, y_position: nil)
  end

  def is_obstructed?(destination)
    @x2 = destination[0].to_i
    @y2 = destination[1].to_i

    x_delta = @x2 - x_position
    y_delta = @y2 - y_position

    @x_dir = x_delta.zero? ? 0 : x_delta / x_delta.abs
    @y_dir = y_delta.zero? ? 0 : y_delta / y_delta.abs

    @x_move = x_position
    @y_move = y_position

    chess_pieces = ChessPiece.where(game_id: game_id)
    possible_blockers = chess_pieces.reject { |cp| cp.x_position.nil? }

    while not_at_destination
      @x_move = x_position + @x_dir
      @y_move = y_position + @y_dir

      blocker = possible_blockers.select { |piece| piece.x_position == @x_move && piece.y_position == @y_move }.count
      return false if blocker.zero?

      return true
    end
    false
  end

  def not_at_destination
    @x_move.send(@x_dir.positive? ? '<' : '>', @x2) ||
      @y_move.send(@y_dir.positive? ? '<' : '>', @y2)
  end

  def selected(piece, chess_piece)
    'selected' if piece == chess_piece
  end

  def board_color(col, row)
    if (col + row).odd?
      'white'
    else
      'black'
    end
  end

  def off_board?(new_x, new_y)
    (new_x < 1 || new_x > 8) || (new_y < 1 || new_y > 8)
  end

  def move_causes_check?(destination)
    x2 = destination[0].to_i
    y2 = destination[1].to_i

    state = false
    ActiveRecord::Base.transaction do
      # move to is coming back false, thus not triggering state to change
      move_piece(x2, y2)
      state = game.in_check?(color)
      raise ActiveRecord::Rollback
    end
    reload
    state
  end
end
