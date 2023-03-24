module StripeService
  module Subscriptions
    class Checkout
      include Interactor
      include Rails.application.routes.url_helpers

      def call
        context.session = Stripe::Checkout::Session.create({
          success_url: url_for(success_path),
          cancel_url: url_for(failure_path),
          mode: 'subscription',
          line_items: [{
            # For metered billing, do not pass quantity
            quantity: 1,
            price: context.params[:stripe_default_price],
          }],
        })
      end
    end
  end
end
