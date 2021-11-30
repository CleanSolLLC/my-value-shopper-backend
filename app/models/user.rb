class User < ApplicationRecord
  has_many :categories
  has_many :items, through: :categories
  has_secure_password(attribute = :password, validations: true)
  validates :email, uniqueness: { case_sensitive: false }
end
