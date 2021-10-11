require 'rails_helper'

RSpec.describe Trade, type: :model do
  it { should have_many(:trade_objects) }
end
