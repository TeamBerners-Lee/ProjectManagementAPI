Rails.application.routes.draw do

  resources :users, defaults: { format: :json }, only: [:index, :create, :show, :update] do
    post 'sign_in', on: :collection
  end

  resources :projects, only: [:index, :create, :show, :update, :destroy] do
    resources :tasks, only: [:index, :create]
  end

  resources :tasks, only: [:show, :update, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
  end

  root 'users#index'
  # get 'amazon/sign_key'
  get '/amazon/sign_key/:id', to: 'amazon#sign_key'
end
