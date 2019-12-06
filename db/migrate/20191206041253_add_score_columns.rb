class AddScoreColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :loser, :integer
    add_column :games, :draw, :boolean

    add_index :games, :loser
    add_index :games, :draw
  end
end
