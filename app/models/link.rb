class Link < ApplicationRecord
  belongs_to :merchant
  has_one :category

  validates :url, presence: true
  validate :url_from_square

  def url_from_square
    if !url.include?("squareup.com/")
      errors[:url] << ("Must be from squareup.com")
    end
  end
end
