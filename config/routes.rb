Rails.application.routes.draw do
  resources :posts
	root 'blogs#index'
  resources :blogs
  devise_for :users
end
