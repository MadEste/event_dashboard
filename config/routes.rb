Rails.application.routes.draw do

	devise_for :users
	resources :events do
		resources :schedules

	end

	resources :schedules do
		resources :days
	end

	# Route for File Downloads
	#get '/events/get/:id' => 'events#get'


	
	get '/home', to: 'page#home'
	get '/help', to: 'page#help'
	get '/about', to: 'page#about'

	authenticated :user do
		root 'events#index', as: "authenticated_root"
	end

	root "page#home"

end