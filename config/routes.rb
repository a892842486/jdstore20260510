Rails.application.routes.draw do
  devise_for :users
  get "welcome/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  root 'products#index'

  namespace :admin do
    resources :products
  end

  resources :carts, only: [:index] do
    collection do
      delete :clean
      get :checkout
    end
  end

  resources :cart_items

  resources :orders, only: [:show, :create]

  namespace :account do
    resources :orders, only: [:index, :show] do
      member do
        post :pay_with_creditcard
        post :pay_with_ewallet
      end
    end
  end

end
