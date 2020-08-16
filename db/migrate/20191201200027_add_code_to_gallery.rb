class AddCodeToGallery < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :episode, :text, after: :caption
  end
end
