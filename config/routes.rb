Rails.application.routes.draw do
  devise_for :users
  root to: "subscriptions#new"
  resources :subscriptions, only: [:new, :create]
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
