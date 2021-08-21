Rails.application.routes.draw do
  root 'home#top'
  get "/login", to: 'users#login_form'
  post "/login", to: "users#login"
  post "/logout", to: "users#logout"
  get "/search", to: "posts#search"
  get "/myrooms/:id", to: "users#myrooms"
  resources :users
  resources :posts do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index,:show, :edit, :update, :destroy]
end
