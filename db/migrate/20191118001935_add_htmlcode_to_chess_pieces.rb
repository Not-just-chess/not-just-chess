class AddHtmlcodeToChessPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :chess_pieces, :htmlcode, :string
  end
end
