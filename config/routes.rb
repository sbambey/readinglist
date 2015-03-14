Rails.application.routes.draw do
  get "contact", to: "static_pages#contact"

  devise_for :users

  resources :users, only: [:show]

  resources :lists, except: [:show, :destroy]

  get "list_items/retrieve_google_book/:title/:field_id", to: "list_items#retrieve_google_book"

  resources :lists, path: '', only: [:show], as: "single_list"

  get "channel.html", to: "static_pages#channel"

  #get ":id", to: "lists#show"

  root to: "lists#index"
end