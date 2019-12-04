class AddTurn < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :turn_player_id, :integer

    add_index :games, :turn_player_id
  end
end
