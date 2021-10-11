FactoryBot.define do
  factory :trade_object do
    player { build(:player) }
    trade { build(:trade) }
  end
end
