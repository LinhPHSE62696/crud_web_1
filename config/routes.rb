Rails.application.routes.draw do
  root to:'posts#index'

  resources :posts, except: [:index]
  #delete 'delete/:id' => 'posts#destroy', as: "delete"
  post 'disable/:id' => 'posts#disable', as: 'disable'

  get 'signup' => 'users#new'
  post 'users' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
