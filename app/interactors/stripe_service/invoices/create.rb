module StripeService
  module Invoices
    class Create
      include Interactor

      def call
        invoice = Invoice.create(
          stripe_invoice_id: context.invoice.id,
          stripe_subscription_id: context.invoice.subscription,
          stripe_customer_id: context.invoice.customer,
          stripe_amount_paid: context.invoice.amount_paid,
          stripe_amount_remaining: context.invoice.amount_remaining,
          stripe_invoice_pdf: context.invoice.invoice_pdf,
          stripe_paid: context.invoice.paid
        )
      end
    end
  end
end