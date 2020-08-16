class AddColumnToGallery < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :title, :string,after: :id
    add_column :galleries, :date_taken, :datetime,default: -> { 'NOW()' }, after: :path
  end
end
