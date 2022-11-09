ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :size, :price, :discount_price, :product_type, :condition, :colour, :sub_category_id, :brand_id,  :images => []

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :size, :price, :discount_price, :product_type, :condition, :category_id, :brand_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form html: { multipart: true } do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :sub_category
      f.input :brand
      f.input :name
      f.input :description
      f.input :size,:input_html => { :maxlength => 10 }
      f.input :colour
      f.input :price
      f.input :discount_price
      f.input :product_type
      f.input :condition



      f.input :images, as: :file, input_html: { multiple: true }
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :sub_category
      row :brand
      row :name
      row :description
      row :size
      row :colour
      row :price
      row :discount_price
      row :product_type
      row :condition
      # row :images do |ad|
      #   # image_tag url_for(ad.images), size:"300x200"
      #   image_tag content(:images).variant
      # end
      row :images do
        div do
          product.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200" 
            end
        end
      end
    end
      active_admin_comments
    end
  end
  
end
