class WishlistsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request

 def index
	@wishlists = Wishlist.all
    render json: @wishlists, status: :ok
  end
  def show
  	 host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

    @products = @current_user.wishlist.products
    @rent_products = @current_user.wishlist.rent_products

  	# debugger
    # 
      data = []
        @products.each do |product|
	        products = {}
	        products[:product] = product
	        products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
	        data << products
	    end
	    
        @rent_products.each do |rent_product|
	        rent_products = {}
	        rent_products[:rent_product] = rent_product
	        rent_products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(rent_product.images.first, only_path: true)
	        data << rent_products
	    end
  
    render json: {
				data: data
			}, status: :ok
    # render json: wishlist, status: :ok
  end
  def add_product
  	# debugger
     wishlist = @current_user.wishlist.products
     chosen_product = Product.find(params[:id])
     if wishlist.include?(chosen_product)
     	render json:{messages:"product has already added in your wishlist"}
     else
	     wishlist.push(chosen_product)
	     render json:{messages:"product successfully added to your wishlist!!"}
	 end
  end
  def remove_product
  	# debugger
     wishlist = @current_user.wishlist.products
     # products = Product.find_by(params[:product_id])
     products = Product.find(params[:id])
     wishlist.delete(products)
     render json: {message: "product is removed from wish"}
  end




    def add_rent_product
    	# debugger
	     wishlist = @current_user.wishlist.rent_products
	     chosen_rent_product = RentProduct.find(params[:id])
	     if wishlist.include?(chosen_rent_product)
	     	render json:{messages:"product has already added in your wishlist"}
	     else
		     wishlist.push(chosen_rent_product)
		     render json:{messages:"product successfully added to your wishlist!!"}
		 end
	end

  def remove_rent_product
  	# debugger
     wishlist = @current_user.wishlist.rent_products
     # products = Product.find_by(params[:product_id])
     rent_products = RentProduct.find(params[:id])
     wishlist.delete(rent_products)
     render json: {message: "product is removed from wish"}
  end




  private
  def wish_params
    params.permit(:product_id)
  end
end
