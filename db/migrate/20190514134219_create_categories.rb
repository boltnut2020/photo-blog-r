class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, :limit=>100
      t.string :slug, :limit=>100
      t.text :description
      t.boolean :active
      t.timestamps
    end
  end
end
