class AddPublishstatusToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publish_status, :boolean, default: false, null: false
    add_column :articles, :deliver_status, :boolean, default: false, null: false
  end
end
