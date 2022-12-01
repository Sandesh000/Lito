class SalesController < ApplicationController
skip_before_action :verify_authenticity_token
	def index
		@sale  = Sale.all
		render json: ActiveModel::Serializer::ArraySerializer.new(@sale, each_serializer: SaleSerializer).as_json, status: :ok
		
	end
	def show
		sale = Sale.find(params[:id])
		render json:  SaleSerializer.new(sale).serializable_hash , status: :ok
	end
end
