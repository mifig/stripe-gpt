module StripeService
  module Subscriptions
    class Subscribe
      include Interactor::Organizer

      organize CheckoutSession
      # FindCreateCustomer, AddPaymentMethod, CreateUpdateSubscription
    end
  end
end