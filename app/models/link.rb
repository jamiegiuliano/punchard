class Link < ApplicationRecord
  belongs_to :merchant

  validates :url, presence: true
  validate :url_from_square

  def url_from_square
    if !url.include?("squareup.com/")
      errors.add('', "must be from squareup.com")
    end
  end
end
