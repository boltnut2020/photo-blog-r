ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#  permit_params :category_id, :country_id, :city_id, :area_id, :place, :price, :price_name, :price_date, :price_origin, :shop_name, :title, :description, :image, :contents, :publish_status, :deliver_status
  permit_params :category_id, :category_item_id, :country_id, :city_id, :area_id, :point_id, :item_id, :address, :latitude, :longitude, :place, :price, :price_explain, :price_name, :price_date, :price_origin, :shop_name, :shop_url, :title, :description, :image,:image2,:image3, :contents, :contents2, :outro, :publish_status, :deliver_status, :intro, :score

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
    column :size do |c|
			if !c.intro.nil? and !c.contents.nil?
					c.intro.size + c.contents.size 
			end
		end
    column :publish_status
    column :category
    actions
  end
  
  form do |f|
		f.inputs do 
  	  f.input :title
  	  f.input :intro, input_html: {rows: 6}
  	  f.input :image
  	  f.input :contents
  	  f.input :category
			f.input :publish_status
		end
		f.actions
  end
end
