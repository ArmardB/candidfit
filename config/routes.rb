Rails.application.routes.draw do

  get 'welcome/index'

	resources :posts

  devise_for :users
	root 'posts#index'
end
