module StripeService
  module Prices
    class Create
      include Interactor
      
      def call
        Price.create!(
          stripe_price_id: context.price.id,
          stripe_product_id: context.price.product,
          stripe_recurrance_interval: context.price.recurring.interval,
          stripe_recurrance_interval_count: context.price.recurring.interval_count,
          stripe_unit_amount: context.price.unit_amount
        )
      end
    end
  end
end