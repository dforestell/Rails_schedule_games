Rails.application.routes.draw do
	root 'users#index'
	get '/', to: 'users#index'
	resources :users, only: [:new, :create, :show]
	resources :sessions, only: [:new, :create, :destroy]
	resources :games, except: [:edit]
end