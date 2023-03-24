module StripeSubscription
  module Products
    class Update
      include Interactor
      
      def call
        plan = Plan.find(context.product.id)
        plan.update(
          stripe_name: context.product.name,
          stripe_product_id: context.product.id,
          stripe_default_price_id: context.product.default_price,
          stripe_description: context.product.description
        )
      end
    end
  end
end