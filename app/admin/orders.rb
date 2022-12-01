ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :order_number, :order_status, :deposit_money, :sub_total, :total
  #
  # or
  #
  # permit_params do
  #   permitted = [:cart_id, :order_number, :order_status, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # actions :all, :except => 
  actions :all, :except => [:destroy, :new]
  index do
    column :order_number
    # column :user_id
    column :user_name do |user|
        (user.user.username)
    end

    column :order_status
    column :deposit_money
    column :sub_total
    column :total

    actions


  end

  form do |f|
    f.inputs "Edit My Model" do
      # f.input :order_status
      f.input :order_status, as: :select, collection: Order.order_statuses.keys
      # f.input :order_status, :as => :select, :collection =>  order_status.keys.to_a
    end
    f.actions
  end

  show do 
    attributes_table do
      row :user do |user|
        (user.user.username)
      end
      row :user_email do |user|
        (user.user.email)
      end
      row :user_mobile_number do |user|
        (user.user.phone_number)
      end
  
      row :order_number
      row :order_status

      row :deposit_money
      row :sub_total
      row :total

      row :products do |order|
        (order.products)

      end
      row :rent_products do |order|
        (order.rent_products)

      end
   
   
           
    end

   div class: 'address' do
      h3 'Address'
      div class: 'attributes_table' do
        table do
          tr do
            th 'first_name'
            th 'last_name'
            th 'country'
            th 'state'
            th 'city'
            th 'area'
            th 'house_number'
            th 'phone_number'
            th 'pincode'
           


          end
            
            tr do
              # debugger
              # td link_to product.name, admin_product_path(product)
              td order.address.first_name
              td order.address.last_name
              td order.address.country
              td order.address.state
              td order.address.city
              td order.address.area
              td order.address.house_number
              td order.address.phone_number
              td order.address.pincode



              # td product.varietal.name
            end
        end
      end
    end
  end
end
 
  

