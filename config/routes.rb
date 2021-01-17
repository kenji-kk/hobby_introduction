Rails.application.routes.draw do
  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'
  resources :users 
  resources :posts,          only: [:new, :create, :destroy]
end
