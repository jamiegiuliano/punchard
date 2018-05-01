class User < ApplicationRecord
  has_secure_password
  has_many :merchants
  has_many :links, through: :merchants

  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, presence: true, length: { in: 5..10 }
end
