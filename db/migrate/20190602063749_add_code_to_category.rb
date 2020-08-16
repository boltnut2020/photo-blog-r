class AddCodeToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name_en, :string, after: :name, :limit=>100
    add_column :categories, :code, :string, after: :name_en, :limit=>100
  end
end
