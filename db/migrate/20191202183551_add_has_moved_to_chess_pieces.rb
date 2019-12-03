class AddHasMovedToChessPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :chess_pieces, :has_moved, :boolean
  end
end
