Rails.application.routes.draw do
  get 'welcome/no_route'

	root 'blogs#index'
  devise_for :users
  resources :posts
  resources :blogs
	get '*path' => redirect('/welcome/no_route')
end
