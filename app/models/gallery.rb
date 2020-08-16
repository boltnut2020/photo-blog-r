class Gallery < ApplicationRecord
  mount_uploader :path, ImageUploader
  def prev
    Gallery.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end
  def next
    Gallery.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

end
