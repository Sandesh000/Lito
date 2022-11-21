ActiveAdmin.register RentPrice do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :rent_product_id, :price, :refundable_deposit, :time_period
  #
  # or
  #
  # permit_params do
  #   permitted = [:rent_product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
