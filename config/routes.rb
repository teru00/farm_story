Rails.application.routes.draw do
  root 'products#index'
  get 'about' => 'static_pages#about'
  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #products
  resources :products
  get 'sellup' => 'products#new'
end
