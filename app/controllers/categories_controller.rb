class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories.all
    render json: @sub_categories

  end
end
