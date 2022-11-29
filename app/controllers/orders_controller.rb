class OrdersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	def index
		
		@orders = @current_user.orders.all
		render json: @orders
    	# render :json => @orders, each_serializer: OrderSerializer

	end
	def show
	end
	def place_order
		
		add = @current_user.address.id
	    @products = @current_user.cart.products
    	@rent_products = @current_user.cart.rent_products
    	@rent_prices = @current_user.cart.rent_prices
		
		  order_number = DateTime.now.strftime("%Y/%m/%d").to_s + SecureRandom.hex(16/4).upcase
		@sub_total = 0
	    @total = 0
	    @shipping_charge = 0
	    @deposit = 0
	    @rent_sub_total = 0


	    @products.each do |product|
	    	price = product.price - product.discount_price
	    	# debugger
	    	@sub_total += price 
	    end
	    @rent_prices.each do |rent_price|
	    	# debugger
	    	@sub_total += rent_price.price 
	    end
	    @rent_prices.each do |rent_price|
	    	# debugger
	    	@deposit += rent_price.refundable_deposit
	    end
	    @total = @sub_total + @deposit + @shipping_charge

	    
		if @current_user.cart.products.present? || @current_user.cart.rent_products.present?

			
			order = @current_user.orders.create(:order_number => order_number, :deposit_money => @deposit, :sub_total => @sub_total, :total => @total, :address_id => add)
			if order.save
	   			rent_products = @current_user.cart.rent_products
				order.rent_products.push(rent_products)
				# render json:{message:"your order successfully placed"}
				@current_user.cart.rent_products.delete(order.rent_products)


				products = @current_user.cart.products
				order.products.push(products)
				# render json:{message:"your order successfully placed"}
				@current_user.cart.products.delete(order.products)
				@current_user.cart.rent_prices.delete(@current_user.cart.rent_prices)
				render json:{message:"order successfully placed"}
			else
				render json:{message:"Please add address "}
			end
		else
			render json:{message:"your cart is empty"}
		end



	end
	def cancel_order
		# debugger
		order = @current_user.orders.find(params[:id])
		if order.order_status == "processing"
			order.delete
			render json:{message:"Order successfully cancelled"}

		else
			render json:{error:"you can not cancel Your order"}
		end

	end


	private
	def order_params
		params.permit(
       		
    )
	end
	def secure_token
	    DateTime.now.strftime("%Y/%m/%d").to_s + SecureRandom.hex(16/4).upcase
	end
	def generate_number
	    possible_values = 'abfhijlqrstuxy'.upcase.split('') | '123456789'.split('')
	    record = true
	    while record
	        random = Array.new(5){possible_values[rand(possible_values.size)]}.join
	        record = Order.find(:first, :conditions => ["number = ?", random])
	    end
	    self.number = random
	end

end
