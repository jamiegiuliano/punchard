# frozen_string_literal: true

class AddStarCountToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :star_count, :integer
  end
end
