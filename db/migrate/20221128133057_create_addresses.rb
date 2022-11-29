class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :state
      t.string :city
      t.string :area
      t.integer :pincode
      t.integer :phone_number, limit: 8
      t.integer :house_number

      t.timestamps
    end
  end
end
