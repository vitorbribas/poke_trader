require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:api_id) }
  it { should validate_presence_of(:base_experience) }
  it { should belong_to(:player).optional }
end
