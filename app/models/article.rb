class Article < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  scope :is_published, -> { where(publish_status: true) }

  def prev
    Article.is_published.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end
  def next
    Article.is_published.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  def price_date
    #
    Time.zone.now if present?
  end
end
