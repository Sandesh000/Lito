class RentProduct < ApplicationRecord
  belongs_to :rent_sub_category
  belongs_to :brand
  has_many :rent_prices
  # has_many :wishproducts
  belongs_to :wishlist
  has_many :wishlists
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders

  # has_and_belongs_to_many :rent_prices



  # has_many :wishlists, through: :wishproducts

  has_many_attached :images
end
