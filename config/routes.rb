Rails.application.routes.draw do
  

  resources :categories
  resources :comments
  resources :articles

  get 'sign_up', to: 'users#new'  
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
