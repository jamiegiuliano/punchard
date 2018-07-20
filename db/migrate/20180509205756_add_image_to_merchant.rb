# frozen_string_literal: true

# Add Merchant's logo
class AddImageToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :image, :string
  end
end
