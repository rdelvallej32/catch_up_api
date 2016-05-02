class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :phone_number
end
