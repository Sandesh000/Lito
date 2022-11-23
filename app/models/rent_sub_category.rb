class RentSubCategory < ApplicationRecord
  belongs_to :category
  has_many :rent_products
  validates :name, presence: true, uniqueness:true
end
