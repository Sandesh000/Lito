class WishlistsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request

 def index
	@wishlists = Wishlist.all
    render json: @wishlists, status: :ok
  end
  def show
    wishlist = @current_user.wishlist.products
    render json: wishlist, status: :ok
  end
  def add_product
  	# debugger
     wishlist = @current_user.wishlist.products
     chosen_product = Product.find(params[:id])
     if wishlist.include?(chosen_product)
     	render json:{messages:"already added"}
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
  private
  def wish_params
    params.permit(:product_id)
  end
end
