Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :user_likes, only: [:create, :destroy]
    resources :blocks, only: [:create, :destroy]
    resources :collaborations, only: [ :create, :destroy]
    patch 'collaborations/:id/accept', to: 'collaborations#accept', as: 'accept_collaboration'
    patch 'collaborations/:id/decline', to: 'collaborations#decline', as: 'decline_collaboration'
  end
  get '/about', to: 'pages#about'
  get '/explorer', to: 'pages#explorer'
  get '/portfolio', to: 'pages#portfolio'

  resources :notifications, only: [:index]

end
