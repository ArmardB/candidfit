Rails.application.routes.draw do

  get 'welcome/index'
	
	

  devise_for :users
  resources :posts do
  	member do 
  		put "like", 		to: "posts#upvote"
  		put "dislike", 	to: "posts#downvote"
  	end
	end
	
	root 'posts#index'
end
