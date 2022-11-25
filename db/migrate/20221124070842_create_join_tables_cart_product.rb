class CreateJoinTablesCartProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts , :products ,id: false do |t|
         t.index [:cart_id, :product_id]
      t.timestamps
    end
  end
end
