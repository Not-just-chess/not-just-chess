# adding to the Games table
class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games, &:timestamps
  end
end
