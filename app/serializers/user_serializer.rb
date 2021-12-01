class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :categories
  has_many :items, through: :categories
end
