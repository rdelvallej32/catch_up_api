#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :contacts, inverse_of: :user, dependent: :destroy,
                      foreign_key: 'user_id'
  has_one :profile, inverse_of: :user
end
