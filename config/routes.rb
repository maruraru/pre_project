Rails.application.routes.draw do
  devise_for :users
	get 'home/index'
	get '/devise/hotels', to: 'hotels#index'
	resources :hotels do
		resource :location
		resources :comments, :rooms
	
	end
	resources :users do
		resources :comments
	end
	root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
