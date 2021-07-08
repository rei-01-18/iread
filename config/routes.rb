Rails.application.routes.draw do
  root to: 'books#index'
  resources :books, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
end