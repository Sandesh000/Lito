class SubCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @sub_categories = SubCategory.all
    # render json: @sub_categories
  end

  def show
    # debugger
    @category = Category.find(params[:category_id])
    @sub_category = @category.sub_categories.find(params[:id])
    @products = @sub_category.products.all
    # host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
    # @All_products = Product.all
      data = []
       @products.each do |product|
      products = {}
      products[:product_type] = product.product_type
      # products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
      data << products
  end
    render json: {
				data: data
			}, status: :ok

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
