Rails.application.routes.draw do
  get "books/send_to" => "books#send_to"
  post "books/send_to" => "books#send_to"


  resources :users
  resources :books
  resources :categories

  root to: "dashboard#index"
  get "/login", to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


end
