class Createjointablerentprice < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts , :rent_prices ,id: false do |t|
         t.index [:cart_id, :rent_price_id]
      t.timestamps
    end
  end
end
