# frozen_string_literal: true

# Controls JSON output for links
class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :merchant_id
  has_one :category
end
