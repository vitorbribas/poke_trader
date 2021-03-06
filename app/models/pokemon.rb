class Pokemon < ApplicationRecord
  # Friendly ID:
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :api_id, :base_experience, presence: true

  belongs_to :player, optional: true
  has_and_belongs_to_many :trade_objects
end
