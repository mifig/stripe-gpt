class PaymentsController < ApplicationController
  def new
    @subscription = current_user.subscriptions.find(params[:subscription_id])
    @quantity = params[:stripe_quantity]

    if @subscription.active?
      redirect_to root_path, notice: "You already have an active subscription."
    end
  end
end
