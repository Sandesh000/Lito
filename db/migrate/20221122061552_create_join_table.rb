class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :wishlists , :products ,id: false do |t|
         t.index [:wishlist_id, :product_id]
      t.timestamps
    end
  end
end
