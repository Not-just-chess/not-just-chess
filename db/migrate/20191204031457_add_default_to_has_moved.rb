class AddDefaultToHasMoved < ActiveRecord::Migration[5.2]
  def change
    change_column_default :chess_pieces, :has_moved, false
  end
end
