module StripeService
  module Prices
    class Update
      include Interactor
      
      def call
        price = Price.find(context.price.id)
        price.update(
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