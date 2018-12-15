Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'books#top'

  get 'books/about'

  get 'books/top'

  get 'users/index' => 'users#index'

  patch '/books/:id' => 'books#update', as: 'update_book'

  patch '/users/:id' => 'users#update', as: 'update_user'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]

  resources :users, only: [:new, :create, :index, :show, :destroy, :edit, :update]

end