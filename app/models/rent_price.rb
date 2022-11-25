class RentPrice < ApplicationRecord
  belongs_to :rent_product
  has_and_belongs_to_many :carts

end
