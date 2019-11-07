class CreatePawns < ActiveRecord::Migration[5.2]
  def change
    create_table :pawns do |t|

      t.timestamps
    end
  end
end
