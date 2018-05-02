class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link

  accepts_nested_attributes_for(:link, update_only: true)

  validates :name, presence: true
end
