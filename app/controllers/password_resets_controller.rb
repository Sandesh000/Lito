class PasswordResetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    render json: {messages: "Email has been sent to your email"}

  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hour.ago
    
      render json: {messages: "Password reset has expired"}
      
    elsif @user.update(user_params)
      # flash[:notice] = 'Password has been reset!'
      redirect_to new_password_reset_path
      # render json: {messages: "Password has been reset!"}
    
    else
      render :edit
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password)
    end



end
