class Subscription < ApplicationRecord
  belongs_to :user, primary_key: :stripe_customer_id, foreign_key: :stripe_customer_id
  belongs_to :plan, primary_key: :stripe_product_id, foreign_key: :stripe_product_id

  enum status: { 
    pending: 0, 
    active: 1, 
    canceled: 2, 
    unpaid: 3, 
    past_due: 4, 
    incomplete: 5, 
    incomplete_expired: 6, 
    trialing: 7, 
    deleted: 8 
  }
end
