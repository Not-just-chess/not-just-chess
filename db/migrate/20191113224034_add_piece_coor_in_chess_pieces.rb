class AddPieceCoorInChessPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :chess_pieces, :x_position, :integer
    add_column :chess_pieces, :y_position, :integer
  end
end
