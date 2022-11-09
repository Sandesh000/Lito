class Product < ApplicationRecord
  belongs_to :sub_category
  belongs_to :brand
  has_many_attached :images

  validates :name, presence: true
end
