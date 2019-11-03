class CreateChessPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :chess_pieces, &:timestamps
  end
end
