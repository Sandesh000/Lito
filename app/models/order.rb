class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_and_belongs_to_many :products
  has_and_belongs_to_many :rent_products


  enum :order_status, { processing: 0, confirmed: 1, completed: 2, return: 3, cancelled: 4 }
end
