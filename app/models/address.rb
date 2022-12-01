class Address < ApplicationRecord
	belongs_to :user
	has_many :orders
	validates :first_name, :last_name, :country, :state, :city, :area, :pincode, :house_number, :user_id, presence: true
	validates :user_id, uniqueness:true
end
