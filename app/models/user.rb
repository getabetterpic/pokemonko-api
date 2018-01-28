class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, maximum: 72 }

  has_secure_password
end
