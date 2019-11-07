class AddColumnsToChessPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :chess_pieces, :type, :string
    add_column :chess_pieces, :game_id, :integer
    add_column :chess_pieces, :color, :string
    add_column :chess_pieces, :captured, :boolean

    add_index :chess_pieces, :game_id
  end
end
