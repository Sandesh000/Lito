class AddAttributesToRentProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :rent_products, :wishlist, foreign_key: true
  end
end
