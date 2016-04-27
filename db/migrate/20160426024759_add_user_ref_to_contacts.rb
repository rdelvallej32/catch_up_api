#
class AddUserRefToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :user, index: true, foreign_key: true, null: false
  end
end
