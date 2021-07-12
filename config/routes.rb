Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end