# frozen_string_literal: true

# Add 'name' column to User
class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
  end
end
