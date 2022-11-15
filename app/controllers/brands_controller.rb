class BrandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @brands = Brand.all.with_attached_image
    render :json => @brands, each_serializer: BrandSerializer
    # render json: @brands
    # render json: brands, include: ['image'], status: :ok
    # render json: BrandSerializer.new(@brands).serializable_hash,status: :ok
  end

  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.all
    host = Rails.application.routes.default_url_options[:host] = "https://localhost:3000/"

    # host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
    # @All_products = Product.all
      data = []
       @products.each do |product|
      products = {}
      products[:product] = product
      products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
      data << products
  end
    render json: {
				data: data
			}, status: :ok





    # render json: @products
  end
end
