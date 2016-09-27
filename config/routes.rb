Rails.application.routes.draw do
  
  resources :comments
  resources :articles

  get 'sign_up', to: 'users#new'  
  resources :users, except: [:new]

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
