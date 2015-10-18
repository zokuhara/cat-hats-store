Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'hats#index'

  get 'users/new' => 'users#new', as: :sign_up
  post '/users' => 'users#create', as: :users

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy', as: :sign_out

  get 'cart' => 'carts#show', as: :shopping_cart
  post 'carts/add/:hat_id' => 'carts#add', as: :add_to_cart
  delete 'carts/remove/:hat_id' => 'carts#remove', as: :remove_from_cart
end
