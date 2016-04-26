#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :contacts, inverse_of: :user, foreign_key: 'user_id'
end
