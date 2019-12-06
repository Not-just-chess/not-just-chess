require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  before :each do
    @g1 = FactoryBot.create(:game)
    @g2 = FactoryBot.create(:game)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)

    @g1.update_attributes(white_player_id: @user1, black_player_id: @user2)
    @g2.update_attributes(white_player_id: @user1, black_player_id: @user2, winner: @user1, loser: @user2, forfeited: true)
  end

  describe 'user_active_games' do
    it 'should display all active_games' do
      user_active_games(@user1)
      expect(@active_games).to match_array([@g1])
    end
  end

  describe 'user_prev_games' do
    it 'should display all previous games' do
      user_prev_games(@user1)
      expect(@prev_games).to match_array([@g2])
    end
  end
end
