class AddDetailsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :reminder, :integer, null: false
  end
end
