class SubscriptionsController < ApplicationController
  def new
  end

  def create
    StripeSubscription::Subscribe.call(params: params)

    redirect_to root_path, notice: "Subscription successfuly created!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end
end
