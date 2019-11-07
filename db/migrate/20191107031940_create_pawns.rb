# Add comments here
class CreatePawns < ActiveRecord::Migration[5.2]
  def change
    create_table :pawns, &:timestamps
  end
end
