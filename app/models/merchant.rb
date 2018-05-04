class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link

  accepts_nested_attributes_for(:link, update_only: true)

  validates :name, presence: true
  validates :location, presence: true

  scope :most_stars, -> {order("star_count ASC LIMIT 1")}

  def self.by_location(location)
    where(location: location)
  end
end
