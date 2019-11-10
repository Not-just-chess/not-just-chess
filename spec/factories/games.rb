FactoryBot.define do
  factory :game do
    id { 1 }

    association :user
  end
end
