Rails.application.routes.draw do
  


  devise_for :users
  resources :users, only: [:show] do 
    resources :shelves, only: [:show, :new]
  end

  root to: "home#index"

  resources :books
  resources :shelves
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
