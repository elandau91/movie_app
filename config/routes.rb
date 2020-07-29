Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  resources :movies
  resources :users


  patch '/sessions/reset_page', to: 'sessions#reset_page', as: 'session_reset'
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'


  get "/search", to: "movies#search", as: "movies_search"
  # For details on the DSL available within this dddfile, see https://guides.rubyonrails.org/routing.html



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
