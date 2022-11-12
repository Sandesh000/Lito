class SubCategoriesController < ApplicationController
  def index
    # @sub_categories = SubCategory.all
    # render json: @sub_categories
  end

  def show
    @sub_category = SubCategory.find(params[:id])
    @products = @sub_category.products.all
    host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"
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

  end
end
