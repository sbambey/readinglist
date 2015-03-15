Rails.application.routes.draw do
	#get "/sitemap.xml.gz" => "static_pages#sitemap"

  constraints(format: /[a-z]+(\.[a-z]+)?/) do
    #resources :sitemaps, only: :show
    get '/sitemap.:format' => 'static_pages#sitemap'
  end

  get "contact", to: "static_pages#contact"

  devise_for :users

  resources :users, only: [:show]

  resources :lists, except: [:destroy]

  get "list_items/retrieve_google_book/:title/:field_id", to: "list_items#retrieve_google_book"

  get "channel.html", to: "static_pages#channel"

  #resources :lists, path: '', only: [:show], as: "single_list"

  get ":id", to: "short_urls#show"

  root to: "lists#index"
end