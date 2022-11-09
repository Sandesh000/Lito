class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :colour
      t.decimal :price
      t.decimal :discount_price
      t.string :product_type
      t.string :condition
      t.references :sub_category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
