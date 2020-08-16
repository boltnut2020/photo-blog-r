class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.text :intro
      t.string :description
      t.string :image
      t.text :contents

      t.timestamps
    end
  end
end
