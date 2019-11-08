# Add comments here
FactoryBot.define do
  factory :chess_piece do
    id { 1 }
    game_id { 1 }
    color { 'white' }
    type { 'King' }
  end
end
