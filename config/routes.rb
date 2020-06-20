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

  get 'home/administrador'
  get 'home/reputation'
  get 'home/purchases'
  get 'home/products'
  get 'home/sales'
  get 'home/summary' 
  get 'home/history'
  get 'home/favorites'
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
