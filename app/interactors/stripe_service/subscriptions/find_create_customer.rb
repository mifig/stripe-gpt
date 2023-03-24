module StripeService
  module Subscriptions
    class FindCreateCustomer
      include Interactor

      def call
        customer_search = Stripe::Customer.search({query: "email:\'#{context.params[:stripe_email]}\'"})
        context.customer = customer_search.data.first
              
        if context.customer.nil?
          context.customer = Stripe::Customer.create(
            email: context.params[:stripe_email],
            payment_method: context.params[:stripe_payment_method],
          )
        end
      end
    end
  end
end