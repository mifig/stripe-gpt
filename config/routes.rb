Rails.application.routes.draw do
  devise_for :users

  # >>>>> WALLIM:
  get "success", to: "pages#success"
  get "failure", to: "pages#failure"
  root "plans#index"
  
  resources :plans, only: [:index, :show], param: :stripe_name do 
    resources :subscriptions, only: [:new, :create]
  end

  resources :subscriptions, only: [] do
    resources :payments, only: [:new]
  end
  
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
