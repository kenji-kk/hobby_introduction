Rails.application.routes.draw do
  root to: 'users#index'
  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'
  get    '/manyusers', to: 'users#manyusers'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts,          only: [:new, :show, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
