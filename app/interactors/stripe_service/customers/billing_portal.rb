module StripeService
  module Customers
    class BillingPortal
      include Interactor
      include Rails.application.routes.url_helpers
      
      def call
        context.portal = Stripe::BillingPortal::Session.create({
          customer: context.user.stripe_customer_id,
          return_url: profile_url
        })
      end
    end
  end
end