module StripeSubscription
  class AddPaymentMethod
    include Interactor

    def call
      customer_payment_methods = Stripe::Customer.list_payment_methods(
        context.customer.id
      )

      context.payment_method = customer_payment_methods.data.find do |payment|
         payment.id == context.params[:stripePaymentMethod]
      end

      if context.payment_method.nil?
        context.payment_method = Stripe::PaymentMethod.attach(
          context.params[:stripePaymentMethod],
          { customer: context.customer.id }
        )
      end
    end
  end
end
