# Contact that belongs to User
class Contact < ActiveRecord::Base
  belongs_to :user, inverse_of: :contacts, class_name: 'User'
  validates :user, presence: true
  validates :user, uniqueness: true
end
