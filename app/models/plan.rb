class Plan < ApplicationRecord
  self.primary_key = :stripe_product_id
  belongs_to  :price, 
              foreign_key: :stripe_default_price_id, 
              primary_key: :stripe_price_id, 
              optional: true
  
  has_many :subscriptions, foreign_key: :stripe_product_id, primary_key: :stripe_product_id
  
  delegate :stripe_price, :stripe_recurrance_interval, :stripe_recurrance_interval_count, to: :price

  def to_param
    stripe_name
  end
end
