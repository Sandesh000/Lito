class Wishlist < ApplicationRecord
  # self.table_name = :Wishlists
  belongs_to :user
  has_and_belongs_to_many :products
  has_many :rent_products
  belongs_to :rent_product
  # has_many :wishproducts
  # has_many :rent_products, through: :wishproducts
end
