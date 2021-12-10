class User < ApplicationRecord
  has_many :items
  has_many :categories
  has_secure_password(attribute = :password, validations: true)
  validates :email, uniqueness: { case_sensitive: false }
end
