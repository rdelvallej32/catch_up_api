#
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :occupation,
             :professional_relationship, :company,
             :last_contacted, :fact, :reminder
  belongs_to :user
end
