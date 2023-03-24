module StripeService
  module Prices
    class Delete
      include Interactor
      
      def call
        price = Price.find(context.price.id)
        price.destroy
      end
    end
  end
end