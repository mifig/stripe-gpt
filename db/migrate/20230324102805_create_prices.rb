class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices, id: false, primary_key: :stripe_price_id do |t|
      t.string :stripe_price_id
      t.string :stripe_product_id
      t.string :stripe_recurrance_interval
      t.integer :stripe_recurrance_interval_count
      t.integer :stripe_unit_amount

      t.timestamps

      t.index :stripe_price_id, unique: true
    end
  end
end
