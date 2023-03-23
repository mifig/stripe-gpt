module StripeSubscription
  class CreateUpdateSubscription
    include Interactor

    def call
      context.subscription = Stripe::Subscription.create(
        customer: context.customer.id,
        items: [ { plan: 'price_1MolgDFx5ifS7TdqzqSNG5xY' } ],
        default_payment_method: context.payment_method.id
      )
  
      Subscription.create(
        email: context.customer.email,
        # start_date: Time.at(subscription.current_period_start).to_date,
        # end_date: Time.at(subscription.current_period_end).to_date,
        stripe_customer_id: context.customer.id,
        stripe_subscription_id: context.subscription.id
      )
    end
  end
end