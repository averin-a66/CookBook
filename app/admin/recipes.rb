ActiveAdmin.register Recipe do

  index do
    column "Создал", :user
    column "Название", :name
    column "Описание", :body

    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :name, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :name, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
