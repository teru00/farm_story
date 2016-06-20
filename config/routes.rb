Rails.application.routes.draw do
  get 'orders/new'
  get 'carts/show'
  get 'store' => 'store#index'
  get 'owners/index'
  get 'owners/show'
  root 'products#index'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #products
  resources :products
  get 'sellup' => 'products#new'
  #owner
  resources :owners, only: [:index, :new, :create, :show]
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:create, :destroy]
  resources :orders
end
