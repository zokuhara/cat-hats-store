Rails.application.routes.draw do

  mount Payola::Engine => '/payola', as: :payola
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'hats#index'

  get 'users/new' => 'users#new', as: :sign_up
  post '/users' => 'users#create', as: :users

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#delete', as: :sign_out

  get 'cart' => 'carts#show', as: :shopping_cart
  post 'carts/add/:hat_id' => 'carts#add', as: :add_to_cart
  delete 'carts/remove/:hat_id' => 'carts#remove', as: :remove_from_cart
  get 'receipt/:sale_guid' => 'carts#receipt', as: :receipt
end
