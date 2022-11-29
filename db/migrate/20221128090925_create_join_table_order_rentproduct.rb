class CreateJoinTableOrderRentproduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders , :rent_products ,id: false do |t|
         t.index [:order_id, :rent_product_id]
      t.timestamps
    end
  end
end
