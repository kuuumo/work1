Rails.application.routes.draw do
  root 'static_pages#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
  get '/confirm', to: 'users#confirm'
  get '/finish_confirm', to: 'users#finish_confirm'
  resources :companies, only: [:new, :create, :destroy]
end