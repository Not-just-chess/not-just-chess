# Add comments here
class CreateBishops < ActiveRecord::Migration[5.2]
  def change
    create_table :bishops, &:timestamps
  end
end
