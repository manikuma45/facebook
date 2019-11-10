Rails.application.routes.draw do
  get '/messages', to: 'messages#index'
	resources :sessions, only: [:new, :create, :destroy]
	resources :users
	root to: "users#new"
end
