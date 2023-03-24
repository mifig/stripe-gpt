module StripeSubscription
  module Products
    class Create
      include Interactor
      
      def call
        Plan.create!(
          stripe_name: context.product.name,
          stripe_product_id: context.product.id,
          stripe_default_price_id: context.product.default_price,
          stripe_description: context.product.description
        )
      end
    end
  end
end