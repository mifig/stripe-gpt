class SubscriptionsController < ApplicationController
  before_action :set_plan, only: [:new, :create]
  before_action :set_subscription, only: [:create]

  def new
  end
  
  def create
    session_interactor = StripeService::Subscriptions::CheckoutSession.call(params: params, stripe_price_id: @plan.stripe_default_price_id, user: current_user)
    @subscription.update(stripe_checkout_session_id: session_interactor.session.id)
    
    redirect_to new_subscription_payment_path(@subscription)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
  
  private
  
  def set_plan
    @plan = Plan.find_by(stripe_name: params[:plan_stripe_name])
  end
  
  def set_subscription
    @subscription = Subscription.find_or_create_by(user: current_user, plan: @plan)
  end
end
