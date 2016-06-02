Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/destroy'

  get 'users/new'

  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  get 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
