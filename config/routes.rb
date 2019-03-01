Rails.application.routes.draw do
  devise_for :users

  root "boards#index"
  resources :users
  resources :boards do
    resources :lists
  end
  resources :lists do
    resources :items
  end
end
