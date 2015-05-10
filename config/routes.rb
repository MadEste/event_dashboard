Rails.application.routes.draw do
  get 'page/home'

  get 'page/about'

  get 'page/help'

  devise_for :users
  resources :events
  
  root "events#index"
end
