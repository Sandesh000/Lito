class Category < ApplicationRecord
	has_many :sub_categories, dependent: :destroy
	has_many :products, through: :sub_categories
	validates :name, presence: true
end
