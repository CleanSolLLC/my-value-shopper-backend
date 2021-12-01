class Category < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :name, uniqueness: true
end
