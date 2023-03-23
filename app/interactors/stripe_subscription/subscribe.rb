module StripeSubscription
  class Subscribe
    include Interactor::Organizer

    organize FindCreateCustomer, AddPaymentMethod, CreateUpdateSubscription
  end
end