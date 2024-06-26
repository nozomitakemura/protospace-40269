Rails.application.routes.draw do
 devise_for :users
 #get 'prototypes/index'
   #get 'prototype/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :prototypes do
    resources :comments, only: :create
  end

  resources :users, only: :show
  #get 'root_path', to: 'prototypes#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
