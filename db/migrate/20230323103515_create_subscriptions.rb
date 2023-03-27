class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :stripe_subscription_id
      t.string :stripe_product_id
      t.string :stripe_checkout_session_id
      t.datetime :stripe_current_period_start
      t.datetime :stripe_current_period_end
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
