class SubscriptionsController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      payment_method: params[:stripePaymentMethod],
    ) 

    Stripe::PaymentMethod.attach(
      params[:stripePaymentMethod],
      { customer: customer.id }
    )

    subscription = Stripe::Subscription.create(
      customer: customer.id,
      items: [ { plan: 'price_1MolgDFx5ifS7TdqzqSNG5xY' } ],
      default_payment_method: params[:stripePaymentMethod]
    ) 

    Subscription.create(
      email: customer.email,
      # start_date: Time.at(subscription.current_period_start).to_date,
      # end_date: Time.at(subscription.current_period_end).to_date,
      stripe_customer_id: customer.id,
      stripe_subscription_id: subscription.id
    )

    redirect_to root_path, notice: "Subscription successfuly created!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end
end
