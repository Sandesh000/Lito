class RentProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :size, :market_price,:colour, :product_type, :condition, :rent_sub_category_id, :brand_id, :created_at, :updated_at, :images
  has_many :rent_prices
  def images
    host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
    # host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"

    if object.images.attached?
      object.images.map { |img|
          # {
          #   id: img.id, filename: img.filename,
          #   url: Rails.application.routes.url_helpers.rails_blob_path(img),
          #   type: img.blob.content_type.split('/')[0]
          # }
      
          host + Rails.application.routes.url_helpers.rails_blob_path(img, only_path: true)
        

      }
      # host + Rails.application.routes.url_helpers.rails_blob_path(object.images, only_path: true)
    else
      "null"
    end
  end

end
