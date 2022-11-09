class SubCategoriesController < ApplicationController
  def index
    # @sub_categories = SubCategory.all
    # render json: @sub_categories
  end

  def show
    @sub_category = SubCategory.find(params[:id])
    @products = @sub_category.products.all
    render json: @products
  end
end
