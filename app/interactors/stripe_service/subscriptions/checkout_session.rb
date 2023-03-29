module StripeService
  module Subscriptions
    class CheckoutSession
      include Interactor
      include Rails.application.routes.url_helpers

      def call
        trial_period = {
            trial_period_days: 30
          }

        context.session = Stripe::Checkout::Session.create({
          success_url: success_url,
          cancel_url: failure_url,
          mode: 'subscription',
          customer: (context.user.stripe_customer_id if context.user.stripe_customer_id),
          customer_email: (context.user.email unless context.user.stripe_customer_id),
          line_items: [{
            # For metered billing, do not pass quantity
            quantity: context.params.dig(:subscription, :stripe_quantity).present? ? context.params.dig(:subscription, :stripe_quantity) : 1,
            price: context.stripe_price_id
          }],
          subscription_data: (trial_period unless context.params.dig(:subscription, :stripe_quantity).present?)
          # payment_method_collection: "if_required"
        })
      end
    end
  end
end
