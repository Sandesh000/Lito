class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: %i[create index]
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # create_wish
      create_cart
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params_update)
      render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
    else
      render json: {message: "updated successfully"}
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
       :username, :email, :password, :password_confirmation, :phone_number
    )
  end
  def user_params_update
    params.permit(
       :username, :email, :password, :password_confirmation, :phone_number, :first_name, :last_name
    )
  end
end