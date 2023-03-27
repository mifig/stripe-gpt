module StripeService
  module Subscriptions
    class CheckoutSession
      include Interactor
      include Rails.application.routes.url_helpers

      def call
        context.session = Stripe::Checkout::Session.create({
          success_url: success_url,
          cancel_url: failure_url,
          mode: 'subscription',
          customer: (context.user.stripe_customer_id if context.user.stripe_customer_id),
          customer_email: (context.user.email unless context.user.stripe_customer_id),
          line_items: [{
            # For metered billing, do not pass quantity
            quantity: 1,
            price: context.stripe_price_id
          }]
        })
      end
    end
  end
end
