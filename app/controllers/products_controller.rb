class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # host = Rails.application.routes.default_url_options[:host] = "https://localhost:3000/"
    
    host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

  	# debugger
    @products = Product.all.reverse
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

  def product_show
    # debugger
    host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
    # @product_type = params[:product_type]
    @all = RentProduct.all

   
      # debugger
    # if params[:rent_product_type].present?
          @pro = @all.each do|rp| 
            rp.product_type 
          # end
          # debugger
            if params[:rent_product_type]== rp.product_type 
           # if @category.name == "Rent"
              @rent_products = RentProduct.where("rent_products.product_type like ?",params[:rent_product_type])
              # render json:@products
              data = []
                  @rent_products.each do |rent_product|
                      rent_products = {}
                      rent_products[:rent_product] = rent_product
                      rent_products[:images] = host + Rails.application.routes.url_helpers.rails_blob_path(rent_product.images.first, only_path: true)
                      data << rent_products
                  end
              render json: {
                  data: data
                }, status: :ok
                # debugger
                  if data.present?
                    break
                  end
            end
        end

      if params[:product_type].present? #@rent_products.present?

        # @product_type = params[:product_type]
        @products = Product.where("products.product_type like ?",params[:product_type])
        # render json:@products
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
        

      end

    

      # end
    end
    
end
