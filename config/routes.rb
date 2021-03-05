Rails.application.routes.draw do
  


  devise_for :users
  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new]
  end

  root to: "books#index"

  resources :books, params: :slug
  resources :shelves
  resources :users

  
end
