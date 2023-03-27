class Invoice < ApplicationRecord
  belongs_to  :subscription, 
              foreign_key: :stripe_subscription_id, 
              primary_key: :stripe_subscription_id
  belongs_to :user,
              foreign_key: :stripe_customer_id,
              primary_key: :stripe_customer_id
end
