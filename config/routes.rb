Rails.application.routes.draw do
  resources :comments
  get "up" => "rails/health#show", as: :rails_health_check

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "posts#index"
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end
  get "about", to: "about#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
