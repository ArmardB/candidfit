Rails.application.routes.draw do

  resources :comments
  get 'welcome/index'
	
	devise_for :users
  
  resources :posts do
  	member do 
  		put "like", 		to: "posts#upvote"
  		put "dislike", 	to: "posts#downvote"
  	end
    resources :comments
  end
  
	root 'posts#index'
end
