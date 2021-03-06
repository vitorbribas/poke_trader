require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it '#full_name' do
    player = build(:player)
    expect(player.full_name).to eq("#{player.first_name} #{player.last_name}")
  end
end
