class Product < ApplicationRecord
  belongs_to :sub_category
  belongs_to :brand
  has_many_attached :images

  validates :name,:description, :size, :price, :discount_price, :product_type, :condition,:colour,  presence: true
  # validate :correct_image_type
  #   def correct_image_type
  #       if images.attached? && images.content_type.include?("image")
  #             if images.attached? && !images.content_type.in?(%w(image/jpg image/png image/jpeg image/webp))
  #                 errors.add(:images, "must be a JPG, JPEG, PNG.")
  #             elsif images.attached? == false
  #                 errors.add(:images, "required.")
  #             end
  #       elsif images.attached? && images.content_type.include?("pdf")
  #               errors.add(:images, "must be image")
  #       elsif images.attached? && images.content_type.include?("video")
        
  #           errors.add(:images, "must be image")
             
  #       else
  #         errors.add(:images, "required.")
  #       end
    # end
end
