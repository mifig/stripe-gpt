class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices, id: false, primary_key: :stripe_invoice_id do |t|
      t.string :stripe_invoice_id
      t.integer :stripe_amount_paid
      t.integer :stripe_amount_remaining
      t.string :stripe_customer_id
      t.string :stripe_subscription_id
      t.string :stripe_invoice_pdf
      t.boolean :stripe_paid

      t.index :stripe_invoice_id, unique: true
      t.timestamps
    end
  end
end
