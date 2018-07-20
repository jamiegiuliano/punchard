# frozen_string_literal: true

# Setup to allow users to login/signup through Omniauth
class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
