Rails.application.routes.draw do
  devise_for :users
  root "themes#index"
  resources :users, only: [:show, :edit, :update]
  resources :themes, only: [:index, :create] do
    resources :answers, only: [:index, :create]
  end
end
