module StripeService
  module Products
    class Delete
      include Interactor
      
      def call
        plan = Plan.find(context.product.id)
        plan.destroy
      end
    end
  end
end