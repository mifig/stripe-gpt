class Price < ApplicationRecord
  self.primary_key = :stripe_price_id
  belongs_to :plan, foreign_key: :stripe_product_id, primary_key: :stripe_product_id
end
