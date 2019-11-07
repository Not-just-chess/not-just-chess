class CreateKnights < ActiveRecord::Migration[5.2]
  def change
    create_table :knights do |t|

      t.timestamps
    end
  end
end
