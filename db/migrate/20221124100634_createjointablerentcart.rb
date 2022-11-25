class Createjointablerentcart < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts , :rent_products ,id: false do |t|
         t.index [:cart_id, :rent_product_id]
      t.timestamps
    end
  end
end
