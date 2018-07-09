class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :link_id
  belongs_to :link
end
