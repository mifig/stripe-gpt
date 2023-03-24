module StripeService
  module Subscriptions
    class Subscribe
      include Interactor::Organizer

      organize Checkout, FindCreateCustomer, AddPaymentMethod, CreateUpdateSubscription
    end
  end
end