Rails.application.routes.draw do

  resources :users, only: [:index, :create, :show, :update]

  resources :projects, only: [:index, :create, :show, :update, :destroy] do
    resources :tasks, only: [:index, :create]
  end

  resources :tasks, only: [:show, :update, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
  end

  root 'home#index'

end
