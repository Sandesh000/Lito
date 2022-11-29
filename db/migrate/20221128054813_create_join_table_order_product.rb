class CreateJoinTableOrderProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders , :products ,id: false do |t|
         t.index [:order_id, :product_id]
      t.timestamps
    end
  end
end
