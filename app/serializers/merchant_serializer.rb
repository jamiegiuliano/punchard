# frozen_string_literal: true

# Controls JSON output for Merchants and db relationships
class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image, :star_count
  has_many :links
  has_many :categories, through: :links
end
