# frozen_string_literal: true

# Track star count with Merchant
class AddStarCountToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :star_count, :integer
  end
end
