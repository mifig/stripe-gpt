module StripeSubscription
  class FindCreateCustomer
    include Interactor

    def call
      customer_search = Stripe::Customer.search({query: "email:\'#{context.params[:stripeEmail]}\'"})
      context.customer = customer_search.data.first
            
      if context.customer.nil?
        context.customer = Stripe::Customer.create(
          email: context.params[:stripeEmail],
          payment_method: context.params[:stripePaymentMethod],
        )
      end
    end
  end
end