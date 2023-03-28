class AddStripeHostedInvoiceUrlToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :stripe_hosted_invoice_url, :string
  end
end
