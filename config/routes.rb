Rails.application.routes.draw do
	root 'users#new'
	resources :users, only: [:new, :create, :show]
	resources :sessions, only: [:new, :create, :destroy]
	resources :games, only: [:new, :show, :create, :destroy]
	get '/games/available' => 'games#index'
end