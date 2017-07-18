Rails.application.routes.draw do
  root to: "dashboard#index"

  get "/login", to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


end
