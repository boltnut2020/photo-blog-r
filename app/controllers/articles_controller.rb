class ArticlesController < ApplicationController
  layout 'front'
  PER=8
  def index
    #@articles = Article.page(params[:page]).per(PER).is_published.reverse_order
    @articles = Article.is_published.reverse_order.limit(10)
		set_default_value
    #@galleries = Gallery.where(["gallery =?", 1]).reverse_order.limit(10)
    @galleries = Gallery.where(["gallery =?", 1]).page(params[:page]).per(PER).reverse_order
    @categories = Category.where(["active =?", 1]).reverse_order.limit(10)
  end

  def show
    #@articles = Article.all
    @article = Article.find(params[:id])
    @article.category = Category.find_by(code: :uncate) if @article.category.nil?
		
    @articles = Article.is_published.where(["id != ?", @article.id]).reverse_order.limit(6)
		@articles_area = Article.where(["id != ?", @article.id]).is_published.reverse_order.limit(6)

    @categories = Category.where(["active =?", 1]).reverse_order.limit(10)
  end

  def city
    @articles = Article.where(city_id: params[:id]).page(params[:page]).per(PER).is_published.reverse_order
		set_default_value
		@city = City.find(params[:id])
		render "index"
  end

  def area
    @articles = Article.where(area_id: params[:id]).page(params[:page]).per(PER).is_published.reverse_order
		set_default_value
		@area = Area.find(params[:id])
		render "index"
  end

  def point
    @articles = Article.where(point_id: params[:id]).page(params[:page]).per(PER).is_published.reverse_order
		set_default_value
		@point = Point.find(params[:id])
		render "index"
  end

  def category
    @articles = Article.where(category_id: params[:id]).page(params[:page]).per(PER).is_published.reverse_order
		set_default_value
		@category = Category.find(params[:id])
		render "index"
  end

  protected
  def set_default_value
	  @articles.each do |article|
            article.category = Category.find_by(code: :uncate) if article.category.nil?
    end
		if @category.nil?
        @category = Category.find_by(code: :uncate)
		end
	end
	
  def get_list

    @articles = Article.page(params[:page]).per(PER).is_published.reverse_order do |article|
            article.country = Country.find_by(code: :uncate) if article.country.nil?
            article.category = Category.find_by(code: :uncate) if article.category.nil?
    end
  end
end
