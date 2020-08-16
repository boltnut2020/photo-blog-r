Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# 
  get '/', to: 'articles#index'
  get '/galleries/', to: 'galleries#index'
  get '/articles/:id', to: 'articles#show',as: 'article'
  get '/galleries/:id', to: 'galleries#show',as: 'gallery'
  get '/category/:id', to: 'articles#category',as: 'category'
end
