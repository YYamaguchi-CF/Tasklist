Rails.application.routes.draw do
	root to: 'toppages#index'
    
  resources :tasks
  resources :users
end
