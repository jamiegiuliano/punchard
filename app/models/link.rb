class Link < ApplicationRecord
  has_one :category, dependent: :destroy

  accepts_nested_attributes_for(:category)

  validates :url, presence: true
  validate :url_from_square

  def url_from_square
    if !url.include?("squareup.com/")
      errors[:url] << ("Must be from squareup.com")
    end
  end
end
