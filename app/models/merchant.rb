class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link, dependent: :destroy

  accepts_nested_attributes_for(:link, update_only: true)

  validates :name, presence: true
  validates :location, presence: true

  scope :count_stars, -> {maximum(:star_count)}

  def self.by_location(location)
    where(location: location)
  end

  def self.current_favorite(stars)
    where(star_count: stars).order(:created_at)
  end
end
