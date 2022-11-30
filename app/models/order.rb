class Order < ApplicationRecord
  # before_create :add_order_number
  belongs_to :user
  belongs_to :address
  has_and_belongs_to_many :products
  has_and_belongs_to_many :rent_products

  enum :order_status, { processing: 0, confirmed: 1, completed: 2, return: 3, cancelled: 4 }


  # ORDER_NO_FORMAT = '0000000'

  # def self.next_order_number
  #   debugger
  #     return Order::ORDER_NO_FORMAT.succ if Order.count.nil?
  #     (if Order.count&.positive?
  #        Order.last&.order_number&.split('OD')[1]
  #      else
  #        Order::ORDER_NO_FORMAT
  #      end).succ
  #   end
  # def add_order_number
  #   debugger
  #     self.order_number = 'OD' + Order.next_order_number
  # end
end
