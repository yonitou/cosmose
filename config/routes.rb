Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :user_likes, only: [:create, :destroy]
  end
  get '/about', to: 'pages#about'
  get '/explorer', to: 'pages#explorer'
end
