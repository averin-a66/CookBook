ActiveAdmin.register UnitSystem do

  index do
    column "Название", :title
    column "Описание", :comment

    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :comment
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
