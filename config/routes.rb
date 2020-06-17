Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :user_likes, only: [:create, :destroy]
    resources :blocks, only: [:create]
    resources :collaborations, only: [ :create, :destroy]
    patch 'collaborations/:id/accept', to: 'collaborations#accept', as: 'accept_collaboration'
    patch 'collaborations/:id/decline', to: 'collaborations#decline', as: 'decline_collaboration'
  end
  get '/about', to: 'pages#about'
  get '/explorer', to: 'pages#explorer'
  get '/portfolio', to: 'pages#portfolio'
  get '/inbox', to: 'pages#inbox'

  resources :notifications, only: [:index]
  resources :blocks, only: [:create, :destroy]
  resources :users, only: [:show] do
    member do
      get '/init_message', to: 'messages#init', as: :init_message
    end
  end
  resources :chatrooms, only: :index do
    resources :messages, only: :create
  end

end
