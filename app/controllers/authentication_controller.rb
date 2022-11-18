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
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
  end
   

  def logout
    debugger
    if @current_user.present?
      @current_user.destroy
      render json:{message:"you have successfully logout"}
    else
      render json:{message:"you are not login"}
    end
  end

  private

  def login_params
    params.permit(:email_or_username, :password)
  end
 
end
