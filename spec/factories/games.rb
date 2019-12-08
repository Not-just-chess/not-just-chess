FactoryBot.define do
  factory :game do
    sequence :id do |n|
      n + 1
    end

    association :user
  end
end
