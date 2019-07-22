Rails.application.routes.draw do

  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only:[:index,:show,:new,:create] do
    member do
      get :likings
    end
  end
  resources :favorites, only:[:create,:destroy]
  resources :posts
end