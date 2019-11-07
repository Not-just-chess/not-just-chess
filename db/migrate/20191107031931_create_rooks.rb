# Add comments here
class CreateRooks < ActiveRecord::Migration[5.2]
  def change
    create_table :rooks, &:timestamps
  end
end
