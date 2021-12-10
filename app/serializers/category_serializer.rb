class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  #belongs_to :user, serializer: UserSerializer
  has_many :items, serializer: ItemSerializer
end
