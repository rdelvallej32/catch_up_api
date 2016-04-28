# Contact that belongs to User
class Contact < ActiveRecord::Base
  belongs_to :user, inverse_of: :contacts, class_name: 'User'
  validates_presence_of :first_name, :last_name, :occupation,
                        :professional_relationship, :company,
                        :last_contacted, :fact
  # validates :first_name, :user, presence: true
  # validates :user, uniqueness: true
end
