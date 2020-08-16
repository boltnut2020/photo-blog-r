class AddColumnsGalleryToGallery < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :gallery, :boolean, after: :active
  end
end
