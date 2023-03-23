Rails.application.routes.draw do
  devise_for :users
  root to: "subscriptions#new"
  resources :subscriptions, only: [:new, :create]
end
