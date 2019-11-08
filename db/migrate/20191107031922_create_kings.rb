# Add comments here
class CreateKings < ActiveRecord::Migration[5.2]
  def change
    create_table :kings, &:timestamps
  end
end
