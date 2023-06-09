module StripeService
  module Subscriptions
    class Update
      include Interactor

      def call
        user = User.find_by(stripe_customer_id: context.subscription.customer)

        subscription = user.subscriptions.find_by(plan: context.subscription.plan.product)
        subscription.update(stripe_subscription_id: context.subscription.id, 
                            stripe_current_period_start: Time.at(context.subscription.current_period_start).to_datetime,
                            stripe_current_period_end: Time.at(context.subscription.current_period_end).to_datetime,
                            stripe_quantity: context.subscription.quantity,
                            status: context.subscription.status)
      end
    end
  end
end