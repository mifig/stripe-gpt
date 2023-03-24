class Plan < ApplicationRecord
  self.primary_key = :stripe_product_id
  belongs_to  :price, 
              foreign_key: :stripe_default_price_id, 
              primary_key: :stripe_price_id, 
              optional: true
end
