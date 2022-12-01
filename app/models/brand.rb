class Brand < ApplicationRecord
	has_one_attached :image
	has_many :products
	validates :name, presence: true, uniqueness: true
	validate :correct_image_type
      private
       def correct_image_type
            if image.attached? && image.content_type.include?("image")
              if image.attached? && !image.content_type.in?(%w(image/jpg image/png image/jpeg image/webp))
                  errors.add(:image, "must be a JPG, JPEG, PNG.")
              elsif image.attached? == false
                  errors.add(:image, "required.")
              end
            elsif image.attached? && image.content_type.include?("pdf")
                errors.add(:image, "must be image")
            elsif image.attached? && image.content_type.include?("video")
        
                    errors.add(:image, "must be image")
             
            else
              errors.add(:image, "required.")
            end
      end
end
