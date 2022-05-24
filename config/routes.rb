Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dwarves do
    resources :reviews, only: [:index, :new, :create]
    resources :reservations, only: [:index, :show, :new, :create]
  end
  resources :reviews, only: [:destroy]
  resources :reservations, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
