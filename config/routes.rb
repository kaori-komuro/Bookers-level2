Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'books#top'

  get 'books/about'

  get 'books/top'

  get 'users/index' => 'users#index'

  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:new, :create, :index, :show, :destroy, :edit, :update]

end