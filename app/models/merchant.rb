class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link

  accepts_nested_attributes_for :link
end
