ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :email, :password_digest, :password_reset_token, :password_reset_sent_at, :phone_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :email, :password_digest, :password_reset_token, :password_reset_sent_at, :phone_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
