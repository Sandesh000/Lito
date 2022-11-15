class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories.all
    render json: @sub_categories

  end
  def edit
    debugger
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories.all


    @products = @sub_categories.find_by_product_type!(params[:_product_type])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'products not found' }, status: :not_found
  end
end
