class SubCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @sub_categories = SubCategory.all
    # render json: @sub_categories
  end

  def show
    # debugger
    @category = Category.find(params[:category_id])
  #   @sub_category = @category.sub_categories.find(params[:id])
  #   @products = @sub_category.products.all
  #     data = []
  #      @products.each do |product|
  #     products = {}
  #     products[:product_type] = product.product_type
    
  #     data << products
  # end
  #   render json: {
		# 		data: data
		# 	}, status: :ok


  if @category.name == "Rent"
    @rent_sub_category = @category.rent_sub_categories.find(params[:id])
    @rent_products = @rent_sub_category.rent_products.all
    # host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
    # @All_products = Product.all
      data = []
    @rent_products.each do |rent_product|
      rent_products = {}
      rent_products[:product_type] = rent_product.product_type
      # products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
      data << rent_products
    end
    render json: {
        data: data
      }, status: :ok
  else
    @sub_category = @category.sub_categories.find(params[:id])
    @products = @sub_category.products.all
      data = []
    @products.each do |product|
      products = {}
      products[:product_type] = product.product_type
    
      data << products
    end
    render json: {
        data: data
      }, status: :ok
  end



  end
  
#   def edit
#     debugger
#         @sub_category = SubCategory.find(1)



#     @products = @sub_category.products.find_by_product_type!(params[:_product_type])
#     render json:@products
#     rescue ActiveRecord::RecordNotFound
#       render json: { errors: 'products not found' }, status: :not_found
#   end
end
