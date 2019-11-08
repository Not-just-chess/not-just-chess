# Add comments here
class CreateKnights < ActiveRecord::Migration[5.2]
  def change
    create_table :knights, &:timestamps
  end
end
