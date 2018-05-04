class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link

  accepts_nested_attributes_for(:link, update_only: true)

  validates :name, presence: true
  validates :location, presence: true

  scope :current_favorite, -> {order(star_count: :desc).limit(2)}

  def self.by_location(location)
    where(location: location)
  end
end
