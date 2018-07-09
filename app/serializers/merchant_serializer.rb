class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image, :star_count
  belongs_to :user
  has_many :links
  has_many :categories, through: :links
end
