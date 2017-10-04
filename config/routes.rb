Rails.application.routes.draw do
	resources :games, only: [:new, :show, :create, :destroy]
	get '/games/available' => 'games#index'
end