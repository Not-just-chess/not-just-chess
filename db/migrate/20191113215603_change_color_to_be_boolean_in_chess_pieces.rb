class ChangeColorToBeBooleanInChessPieces < ActiveRecord::Migration[5.2]
  def change
    change_column :chess_pieces, :color, 'boolean USING CAST(color AS boolean)'
  end
end
