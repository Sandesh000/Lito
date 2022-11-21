class RentProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    host = Rails.application.routes.default_url_options[:host] = "https://localhost:3000/"
    
    # host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

  	# debugger
    @rent_products = RentProduct.all
      data = []
       @rent_products.each do |rent_product|
      rent_products = {}
      rent_products[:rent_product] = rent_product
      rent_products[:rent_prices]= rent_product.rent_prices
      rent_products[:images] = host + Rails.application.routes.url_helpers.rails_blob_path(rent_product.images.first, only_path: true)
      data << rent_products
  end
    # @products = @All_products.first.images.first
    # render json: @products
    # render json: ProductSerializer.new(@products).serializable_hash,status: :ok
    # render :json => data, each_serializer: ProductSerializer
    render json: {
				data: data
			}, status: :ok

  end

  def show
  	@rent_product = RentProduct.find(params[:id])
  	render json:@rent_product
  end

  def product_show
    host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

    @product_type = params[:product_type]
    @rent_products = RentProduct.where("rent_products.product_type like ?",params[:product_type])
    # render json:@products
    data = []
    # debugger
         @rent_products.each do |rent_product|
        rent_products = {}
        rent_products[:rent_product] = rent_product
        rent_products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(rent_product.images.first, only_path: true)
        data << rent_products
    end
    render json: {
        data: data
      }, status: :ok

  end
end
