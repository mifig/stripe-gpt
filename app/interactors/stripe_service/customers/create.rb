module StripeService
  module Customers
    class Create
      include Interactor
      
      def call
        user = User.find_by(email: context.customer.email)
        user.update(stripe_customer_id: context.customer.id) if user.stripe_customer_id.nil? || user.stripe_customer_id != context.customer.id
      end
    end
  end
end