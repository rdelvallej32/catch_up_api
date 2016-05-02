#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :contacts
  has_one :profile
end
