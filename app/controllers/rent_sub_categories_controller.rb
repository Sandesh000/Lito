class RentSubCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @sub_categories = SubCategory.all
    # render json: @sub_categories
  end

  def show
    # debugger
    @category = Category.find(params[:category_id])
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

  end
end
