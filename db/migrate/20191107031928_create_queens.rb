# Add comments here
class CreateQueens < ActiveRecord::Migration[5.2]
  def change
    create_table :queens, &:timestamps
  end
end
