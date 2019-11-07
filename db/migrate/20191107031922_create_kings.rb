class CreateKings < ActiveRecord::Migration[5.2]
  def change
    create_table :kings do |t|

      t.timestamps
    end
  end
end
