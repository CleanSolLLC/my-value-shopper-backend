class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user
  has_many :items
end
