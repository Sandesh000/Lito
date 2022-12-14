class AuthenticationController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: :login


  # POST /auth/login
  def login
    
      @user = User.find_by(email: params[:email_or_username]) 
      unless @user.present?
        # debugger
        @user = User.find_by(username: params[:email_or_username]) 
        unless @user.present?
          render json:{error:"user not found"}
        end
      end
    # else
       # @user = User.find_by_username(params[:loginn])
    # end
  if @user.present?
    if @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      # create_wish
      # create_cart
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
  end
   

 

  private

  def login_params
    params.permit(:email_or_username, :password)
  end
 
end
