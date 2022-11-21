class RentProduct < ApplicationRecord
  belongs_to :rent_sub_category
  belongs_to :brand
  has_many :rent_prices
  has_many_attached :images
end
