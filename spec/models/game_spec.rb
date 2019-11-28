require 'rails_helper'

RSpec.describe Game, type: :model do
   describe 'in_check?' do
    it 'should return true if king in check' do
      game = FactoryBot.create(:game)
      FactoryBot.create(:king, color: true, game_id: game.id, x_position: 3, y_position: 8)
      FactoryBot.create(:bishop, color: false, game_id: game.id, x_position: 6, y_position: 5)
      expect(game.in_check?(true)).to eq(true)
    end

    it 'should return false if king is not in check' do
      game = FactoryBot.create(:game)
      FactoryBot.create(:king, color: true, game_id: game.id, x_position: 3, y_position: 8)
      FactoryBot.create(:bishop, color: false, game_id: game.id, x_position: 7, y_position: 5)
      expect(game.in_check?(true)).to eq(false)
    end
  end
end
