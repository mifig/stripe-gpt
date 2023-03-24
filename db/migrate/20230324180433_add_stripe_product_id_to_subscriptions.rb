class AddStripeProductIdToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :stripe_product_id, :string
  end
end
