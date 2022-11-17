class CreateRentProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :rent_products do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :colour
      t.decimal :market_price
      t.decimal :rent_price, array: true, default: []
      t.decimal :refundable_deposit, array: true, default: []
      t.string :product_type
      t.string :condition
      t.references :sub_category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
