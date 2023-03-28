class AddStripeQuantityToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :stripe_quantity, :integer
  end
end
