Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :users, only: %i[index ver_datos] do
    get :ver_datos, on: :member
  end

  resource :user, only: %i[edit destroy update show] do
    collection do
      patch 'update_password'
      get :cambiar_password
    end
  end

  resources :favorites, only: %i[create destroy]
  resources :my_shopping_carts, only: %i[create destroy]
  get "/add/:product_id", as: :add_to_cart, to: "my_shopping_carts#create"

  namespace :paypal do
    resources :checkouts, only: [:create] do
      collection do
        get :complete
      end
    end
  end

  get 'home/search'
  get 'home/car'
  get 'home/administrador'
  get 'home/reputation'
  get 'home/purchases'
  get 'home/products'
  get 'home/sales'
  get 'home/summary'
  get 'home/history'
  get 'home/favorites'
  resources :categories
  resources :products do
    resources :imagenes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
