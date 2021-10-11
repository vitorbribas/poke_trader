FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon }
    api_id { Faker::Number.number(digits: 2) }
    base_experience { Faker::Number.number(digits: 3) }
  end
end
