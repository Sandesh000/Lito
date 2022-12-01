class SaleSerializer < ActiveModel::Serializer
  attributes  *[:id, :product_id, :market_price, :discount_price]
  attribute :product do |object|
        @object.product


  end
  attribute :images do |object|
      host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

    if @object.product.images.attached?
      @object.product.images.map { |img|
          host + Rails.application.routes.url_helpers.rails_blob_path(img, only_path: true)
        }
    else
      "null"
    end

  end
  attribute :sale_price do |object|
    @object.market_price - @object.discount_price
  end
  attribute :discount_percentage do |object|
    @object.discount_price/@object.market_price*100
  end

end