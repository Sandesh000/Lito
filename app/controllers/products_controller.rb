class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: @products
    # render json: ProductSerializer.new(@products).serializable_hash,status: :ok
    render :json => @products, each_serializer: ProductSerializer

  end

  def show
  end
end
