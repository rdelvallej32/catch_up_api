class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :username, null: false
      t.text :phone_number

      t.timestamps null: false
    end
  end
end
