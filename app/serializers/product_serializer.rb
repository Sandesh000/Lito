class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :size, :price, :discount_price, :product_type, :condition, :sub_category_id, :brand_id, :created_at, :updated_at, :images
  # attribute :images do |object|
  #       object.images.attached?
  #       # url: Rails.application.routes.url_helpers.url_for(image)
  #       Rails.application.routes.url_helpers.rails_blob_path(object.images, only_path: true)
  #     end
  
  # attributes :images_url do |object, params|
  #   byebug
  #   host = "http://localhost:3000/"
  #   object.images_url(host)
  # end
  # attribute :images do |object|
  #   byebug
  #     object.images.attached? 
  #       object.images.map { |img|
  #         {
  #           id: img.id, filename: img.filename,
  #           url: Rails.application.routes.url_helpers.url_for(img),
  #           type: img.blob.content_type.split('/')[0]
  #         }
  #       } 
  #   end
  def images
    host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"
    if object.images.attached?
      object.images.map { |img|
          {
            id: img.id, filename: img.filename,
            url: Rails.application.routes.url_helpers.rails_blob_path(img),
            type: img.blob.content_type.split('/')[0]
          }
        }
      # host + Rails.application.routes.url_helpers.rails_blob_path(object.images, only_path: true)
    else
      "null"
    end
  end
end
