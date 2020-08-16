class ApplicationController < ActionController::Base
  before_action :get_header_image

  def get_header_image
    gallery_header_image = Gallery.limit(1).order("RAND()")
    @header_image_url = gallery_header_image[0].path
  end
end
