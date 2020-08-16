class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.text :caption
      t.string :path
      t.boolean :active
      t.timestamps
    end
  end
end
