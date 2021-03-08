Rails.application.routes.draw do
  
  resources :books_authors
  root to: "books#index"

  resources :authors
  devise_for :users

  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new]
  end

  resources :books, params: :isbn

  resources :shelves
  resources :users

end
