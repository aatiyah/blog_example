Rails.application.routes.draw do
	root 'blogs#index'
  devise_for :users
  resources :posts
  resources :blogs
end
