ActiveAdmin.register Sale do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :market_price, :discount_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form html: { multipart: true } do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      # f.input :sub_categories, input_html: { class: "default" }
      f.input :product, input_html: { class: "default" }
      f.input :market_price
      f.input :discount_price
      f.actions
    end
  end
  show do
    attributes_table do
      row :product
      row :market_price
      row :discount_price
      row :sale_price do |s|
      s = (sale.market_price - sale.discount_price)
      end
      row :discount_percentage do |pd|
        pd = (sale.discount_price/sale.market_price)*100
      end
      active_admin_comments
    end
  end
  
end
