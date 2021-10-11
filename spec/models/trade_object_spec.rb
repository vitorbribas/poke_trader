require 'rails_helper'

RSpec.describe TradeObject, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:trade) }
end
