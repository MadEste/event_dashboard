Rails.application.routes.draw do



	devise_for :users
	resources :events

	root "events#index"
	
	get '/home', to: 'page#home'
	get '/help', to: 'page#help'
	get '/about', to: 'page#about'

end