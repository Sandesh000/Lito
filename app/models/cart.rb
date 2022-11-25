class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  has_and_belongs_to_many :rent_products
  has_and_belongs_to_many :rent_prices



end
