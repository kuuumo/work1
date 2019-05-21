Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    get 'confirm', on: :collection, to: 'users#confirm'
    post 'finish_confirm', on: :collection, to: 'users#finish_confirm'
  end
  resources :companies, only: [:new, :create, :destroy]
end