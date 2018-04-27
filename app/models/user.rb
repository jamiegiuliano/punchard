class User < ApplicationRecord
  has_secure_password
  has_many :merchants
  has_many :links, through: :merchants
end
