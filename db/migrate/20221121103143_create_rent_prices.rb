class CreateRentPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :rent_prices do |t|
      t.references :rent_product, null: false, foreign_key: true
      t.decimal :price
      t.decimal :refundable_deposit
      t.string :time_period

      t.timestamps
    end
  end
end
