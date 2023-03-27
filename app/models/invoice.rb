class Invoice < ApplicationRecord
  self.primary_key = :stripe_invoice_id

  belongs_to  :subscription, 
              foreign_key: :stripe_subscription_id, 
              primary_key: :stripe_subscription_id
  belongs_to :user,
              foreign_key: :stripe_customer_id,
              primary_key: :stripe_customer_id
  
  monetize :stripe_amount_paid, as: :stripe_amount_paid_in_cents
  monetize :stripe_amount_remaining, as: :stripe_amount_remaining_in_cents
end
