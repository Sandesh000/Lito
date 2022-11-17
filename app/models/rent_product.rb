class RentProduct < ApplicationRecord
  belongs_to :sub_category
  belongs_to :brand
  has_many_attached :images

  validates :name,:description, :size, :rent_price, :refundable_deposit, :market_price, :product_type, :condition,:colour,  presence: true
end
