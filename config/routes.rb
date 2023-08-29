Rails.application.routes.draw do
  # get 'products/index'
  resources :products do
    post 'add_to_cart', on: :member
 end
  # post '/charge', to: 'charges#create'
  # root 'product#index'
  resources :blogs
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
