class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :categories, serializer: CategorySerializer
  has_many :items, serializer: ItemSerializer
end
