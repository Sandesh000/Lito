class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    host = Rails.application.routes.default_url_options[:host] = "https://localhost:3000/"
    
    # host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

  	# debugger
    @products = Product.all
      data = []
       @products.each do |product|
      products = {}
      products[:product] = product
      products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
      data << products
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
  	@product = Product.find(params[:id])
  	render json:@product
  end
end
