class AddImageToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image2, :string, after: :image
    add_column :articles, :image3, :string, after: :image2
  end
end
