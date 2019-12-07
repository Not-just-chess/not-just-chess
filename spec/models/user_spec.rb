require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @game = FactoryBot.create(:game)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe 'wins' do
    it 'should display the count for a users won games' do
      @game.update_attributes(winner: @user1.id)
      expect(@user1.wins).to eq(1)
      expect(@user2.wins).to eq(0)
    end
  end

  describe 'losses' do
    it 'should display the count for a users lost games' do
      @game.update_attributes(loser: @user1.id)
      expect(@user1.losses).to eq(1)
      expect(@user2.losses).to eq(0)
    end
  end

  describe 'draws' do
    it 'should display the count for a users tied games' do
      @game.update_attributes(draw: true)
      expect(@user1.draws).to eq(1)
      expect(@user2.draws).to eq(1)
    end
  end
end
