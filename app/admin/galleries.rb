ActiveAdmin.register Gallery do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :caption, :episode, :path, :date_taken, :active, :gallery

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    column :id
    column :title
    column :caption
    column :episode
    column :path do |c|
      if c.path.present?
        puts(c)
        image_tag(c.path.small.url)
      end
    end
    column :date_taken
    column :active
    column :gallery
    actions
  end

  form do |f|
    f.inputs do
      f.inputs :title
      f.inputs :caption
      f.input :episode
      f.inputs :path
      f.input :date_taken
      f.input :active
      f.input :gallery
    end
    f.actions
  end
end
