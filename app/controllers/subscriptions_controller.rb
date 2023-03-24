class SubscriptionsController < ApplicationController
  before_action :set_plan, only: [:new, :create]

  def new
  end
  
  def create
    @subscription = Subscription.create(
      stripe_customer_id: current_user.stripe_customer_id,
      plan: @plan
    )
    session_interactor = StripeService::Subscriptions::Subscribe.call(params: params, stripe_price_id: @plan.stripe_default_price_id, user: current_user)
    @subscription.update(stripe_checkout_session_id: session_interactor.session.id)

    redirect_to new_subscription_payment_path(@subscription)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_payment_path(@subscription)
  end
  
  def set_plan
    @plan = Plan.find_by(stripe_name: params[:plan_stripe_name])
  end
end
