# frozen_string_literal: true

# Initial creation of Link schema
class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :merchant_id

      t.timestamps
    end
  end
end
