class ChangeColumnsAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :chess_pieces, :game_id, true
    change_column_null :chess_pieces, :captured, true
    change_column_null :chess_pieces, :color, true
  end
end
