Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}

  
  root to: "home#index"
  
  resources :posts


  resources :reading_rooms
  resources :reading_rooms, only: [:show] do
    resources :posts, only: [:new, :edit, :update]
  end
  

  resources :authors
  
  
  resources :shelves
  resources :users
  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new, :edit]
    resources :posts, only: [:index]
  end

  resources :books, params: :isbn


end
