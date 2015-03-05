Rails.application.routes.draw do
  resources :lists do
  	resources :list_items
  end

  root to: "lists#index"
end