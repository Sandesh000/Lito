class AddressesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request

	def index
		@address = @current_user.address
		render json:@address
	end

	def create
		@address = Address.new(address_params)
		# @address = Address.create(user_id: @user.id)
		if @address.save
			render json:{message:"address added"}
		else
			render json:{message:"something have wrong"}
		end

	end
	def update
		address = @current_user.address
		if address.update(address_params)
			render json:{message:"updated"}
		else
			render json:{message:"something have wrong"}
		end

	end



	private
	def address_params
		params.permit( :first_name, :last_name, :country, :state, :city, :area, :pincode,:house_number, :phone_number, :user_id
       		
    )
	end
end
