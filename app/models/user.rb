# frozen_string_literal: true

# Each User is able to create an account to hold their seperate Square info.
class User < ApplicationRecord
  validates :email, :password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:github]

  has_many :merchants, dependent: :destroy
  has_many :links, through: :merchants

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.image = auth.info.image
    end
  end
end
