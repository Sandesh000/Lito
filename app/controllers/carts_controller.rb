class CartsController < ApplicationController
skip_before_action :verify_authenticity_token
	before_action :authorize_request

 def index
	@carts = Cart.all
    render json: @carts, status: :ok
  end
  def show
  	 host = Rails.application.routes.default_url_options[:host] = "https://litoo.herokuapp.com/"

    @products = @current_user.cart.products
    @rent_products = @current_user.cart.rent_products
    @rent_prices = @current_user.cart.rent_prices


  	# debugger
    # 
      data = []
        @products.each do |product|
	        products = {}
	        products[:product] = product
	        products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(product.images.first, only_path: true)
	        # cart_total[:total] = product.price
	        data << products
	    end
        @rent_products.each do |rent_product|
	        rent_products = {}
	        rent_products[:rent_product] = rent_product
	        # debugger
	        
	        # rent_products[:rent_prices] = rent

	        rent_products[:images] =host + Rails.application.routes.url_helpers.rails_blob_path(rent_product.images.first, only_path: true)
	        data << rent_products
	    end
	    rent_prices = {}
	    rent_prices[:rent_prices] = @rent_prices
	    data << rent_prices

	    @sub_total = 0
	    @total = 0
	    @shipping_charge = 0
	    @deposit = 0
	    @rent_sub_total = 0


	    @products.each do |product|
	    	# debugger
	    	@sub_total += product.price 
	    end

	    # @rent_products.each do |rent_product|
	    # 	# debugger
	    # 	@rent_sub_total += rent_product.rent_prices
	    # end
	    	sub_totals = {}
	    	@total = @sub_total + @deposit + @shipping_charge

	        sub_totals[:sub_total] = @sub_total
	        sub_totals[:shiping_charge] = @shipping_charge
	        sub_totals[:deposit] = @deposit
	        sub_totals[:total] = @total
	        data << sub_totals
	    # end
	     
	     # data << sub_total
	    
  
    render json: {
				data: data
			}, status: :ok
    # render json: wishlist, status: :ok
  end
  def add_product
  	# debugger
     cart = @current_user.cart.products
     chosen_product = Product.find(params[:id])
     if cart.include?(chosen_product)
     	render json:{messages:"product has already added in your cart"}
     else
	     cart.push(chosen_product)
	     render json:{messages:"product successfully added to your cart!!"}
	 end
  end
  def remove_product
  	# debugger
     cart = @current_user.cart.products
     # products = Product.find_by(params[:product_id])
     products = Product.find(params[:id])
     cart.delete(products)
     render json: {message: "product is removed from wish"}
  end

  def add_rent_product
  	# debugger
     cart = @current_user.cart.rent_products
     cartprice = @current_user.cart.rent_prices

     chosen_rent_product = RentProduct.find(params[:id])
     debugger
     chosen_rent_price = chosen_rent_product.rent_prices.find(params[:rent_price_id])
     # chosen_rent_product = chosen_rent_product + chosen_rent_price
     # @rent = chosen_rent_product.rent_prices 
     # $rent = chosen_rent_price
     # chosen = []
     # chosen.push(chosen_rent_product)
     # chosen.push(chosen_rent_price)
     # chosen_rent_product.push(chosen_rent_price)
     # debugger
     if cart.include?(chosen_rent_product)
     	render json:{messages:"rent_product has already added in your cart"}
     else
	     # cart.push(chosen)
	     cart.push(chosen_rent_product)
	     if cartprice.include?(chosen_rent_price)
     		# render json:{messages:"rent_price has already added"}
     	else
     		cartprice.push(chosen_rent_price)
     		# render json:{messages:"rent_price added"}
     	end


	     # cart.push(chosen_rent_price)
	     render json:{messages:"rent_product successfully added to your cart!!"}
	 end
  end
  def remove_rent_product
  	# debugger
     cart = @current_user.cart.rent_products
     cartprice = @current_user.cart.rent_prices

     # products = Product.find_by(params[:product_id])
     chosen_rent_product = RentProduct.find(params[:id])
     chosen_rent_price = chosen_rent_product.rent_prices.find(params[:rent_price_id])

     cart.delete(chosen_rent_product)
     cartprice.delete(chosen_rent_price)
     render json: {message: "rent_product is removed from wish"}
  end








end
