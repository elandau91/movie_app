Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  resources :movies
  resources :users


  patch '/sessions/reset_page', to: 'sessions#reset_page', as: 'session_reset'
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'


  get "/search", to: "movies#search", as: "movies_search"

  
  post '/users/:id/follow', to: 'users#follow', as: 'follow_user'

  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"


  get '/users/:id/followers', to: 'users#followers_list', as: 'followers_list'
  get '/users/:id/followees', to: 'users#followees_list', as: 'followees_list'
  # For details on the DSL available within this dddfile, see https://guides.rubyonrails.org/routing.html



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
