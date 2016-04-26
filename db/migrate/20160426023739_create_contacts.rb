class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :occupation, null: false
      t.string :professional_relationship, null: false
      t.string :company, null: false
      t.date :last_contacted, null: false
      t.string :fact, null: false

      t.timestamps null: false
    end
  end
end
