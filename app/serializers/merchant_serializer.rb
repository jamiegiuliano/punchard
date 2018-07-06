class MerchantSerializer < ActiveModel::Serializer
  attributes :name, :location, :star_count, :image
  belongs_to :user
end
