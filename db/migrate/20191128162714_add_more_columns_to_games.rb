class AddMoreColumnsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :winner, :integer
    add_column :games, :checkmate, :boolean, default: false
    add_column :games, :forfeited, :boolean, default: false

    add_index :games, :winner
  end
end
