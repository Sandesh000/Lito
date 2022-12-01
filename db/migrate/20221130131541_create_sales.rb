class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.belongs_to :product
      t.decimal :market_price
      t.decimal :discount_price

      t.timestamps
    end
  end
end
