Rails.application.routes.draw do
  root to: "books#index"
  
  resources :books_authors

  resources :authors
  devise_for :users
  
  resources :users
  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new]
  end

  resources :books, params: :isbn

  resources :shelves

end
