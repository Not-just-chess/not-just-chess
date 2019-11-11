class AddColumnsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :user_id, :integer
    add_column :games, :white_player_id, :integer
    add_column :games, :black_player_id, :integer

    add_index :games, :user_id
    add_index :games, :white_player_id
    add_index :games, :black_player_id
  end
end
