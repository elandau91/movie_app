Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  resources :movies
  resources :users

  get "/search", to: "movies#search", as: "movies_search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
