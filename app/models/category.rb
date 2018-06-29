class Category < ApplicationRecord
  belongs_to :link
  belongs_to :merchant
end
