class CreateMessages < ActiveRecord::Migration[5.2]
	def change
		create_table :messages do |t|
			t.string :content
			t.integer :game_id
			t.integer :user_id
			t.timestamps 
		end
		add_index :games, :id
		add_index :users, :id
	end
end
