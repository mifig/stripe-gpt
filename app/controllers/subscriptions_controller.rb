class SubscriptionsController < ApplicationController
  before_action :set_plan, only: [:new, :create]

  def new
  end
  
  def create
    StripeService::Subscriptions::Subscribe.call(params: params)
    
    redirect_to root_path, notice: "Subscription successfuly created!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end
  
  def set_plan
    @plan = Plan.find_by(stripe_name: params[:plan_stripe_name])
  end
end
