class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :categories, Serializer: CategorySerializer
  has_many :items, Serializer: ItemSerializer
end
