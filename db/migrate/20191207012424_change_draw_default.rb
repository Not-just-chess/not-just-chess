class ChangeDrawDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :games, :draw, false
  end
end
