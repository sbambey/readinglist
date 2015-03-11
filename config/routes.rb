Rails.application.routes.draw do
  get "contact", to: "static_pages#contact"

  devise_for :users

  resources :users, only: [:show]

  resources :lists, except: [:destroy]

  get "list_items/retrieve_google_book/:title", to: "list_items#retrieve_google_book"

  root to: "lists#index"
end