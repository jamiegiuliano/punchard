class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image
  belongs_to :user
  has_many :links
end
