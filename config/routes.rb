Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'books#new'

  get 'books/about'

  get 'books/top'

  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:new, :create, :index, :show, :destroy, :edit, :update]

end