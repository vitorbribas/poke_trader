class Player < ApplicationRecord
  # Friendly ID:
  extend FriendlyId
  friendly_id :full_name_slug, use: :slugged

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || first_name_changed? || last_name_changed?
  end

  def full_name_slug
    return unless first_name.present? && last_name.present?

    ["#{first_name.parameterize}-#{last_name.parameterize}"]
  end
end
