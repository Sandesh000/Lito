class BrandsController < ApplicationController
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
    render json: @products
  end
end
