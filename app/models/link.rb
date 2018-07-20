# frozen_string_literal: true

# Refers to specific Square link
class Link < ApplicationRecord
  has_one :category, dependent: :destroy
  belongs_to :merchant

  accepts_nested_attributes_for(:category)

  validates :url, presence: true
  validate :url_from_square

  def url_from_square
    return errors[:url] << 'Must be from squareup.com' unless
      url.include?('squareup.com/')
  end
end
