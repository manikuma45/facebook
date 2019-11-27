Rails.application.routes.draw do
#  get '/messages', to: 'messages#index'
#resources :nices, only:[:create, :destroy]
resources :messages do
		collection do
			post :confirm
		end
	end
	resources :sessions, only: [:new, :create, :destroy]
	resources :users
	root to: "sessions#new"
	resources :nices, only:[:create, :destroy]
end
