class CreateRooks < ActiveRecord::Migration[5.2]
  def change
    create_table :rooks do |t|

      t.timestamps
    end
  end
end
