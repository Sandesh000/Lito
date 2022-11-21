class RentSubCategory < ApplicationRecord
  belongs_to :category
  has_many :rent_products
end
