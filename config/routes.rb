Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#show"
  post "todos", to: "todos#create"
  put "todos/:id", to: "todos#update"
  delete "todos/:id", to: "todos#destroy"
  resources :users
  post "users/login", to: "users#login"
  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_session
  post "/signin", to: "sessions#create", as: :session
end
