class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :professional_relationship
      t.string :company
      t.date :last_contacted
      t.string :fact

      t.timestamps null: false
    end
  end
end
