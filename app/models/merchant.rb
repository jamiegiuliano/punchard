class Merchant < ApplicationRecord
  belongs_to :user
  has_one :link
end
