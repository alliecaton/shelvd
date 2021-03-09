Rails.application.routes.draw do
  
  root to: "books#index"
  
  resources :posts
  resources :reading_rooms
  resources :reading_rooms, only: [:show] do
    resources :posts, only: [:new]
  end
  

  resources :authors
  
  devise_for :users
  
  resources :users
  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new]
  end

  resources :books, params: :isbn

  resources :shelves

end
