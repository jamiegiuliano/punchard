# frozen_string_literal: true

# Create Categories for Links
class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :link_id

      t.timestamps
    end
  end
end
