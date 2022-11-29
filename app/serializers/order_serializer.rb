class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number, :order_status, :deposit_money, :sub_total, :total
  has_many :products
  has_many :rent_products

  
end