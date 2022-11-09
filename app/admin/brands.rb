ActiveAdmin.register Brand do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :image do |ad|
        image_tag url_for(ad.image), size:"300x200"
      end
      active_admin_comments
    end
  end
  
  
end
