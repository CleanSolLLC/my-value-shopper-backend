class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user
  belongs_to :item
end
