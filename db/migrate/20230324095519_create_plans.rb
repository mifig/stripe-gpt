class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans, id: false, primary_key: :stripe_product_id do |t|
      t.string :stripe_product_id, null: false
      t.string :stripe_name
      t.string :stripe_default_price_id
      t.text :stripe_description

      t.timestamps

      t.index :stripe_product_id, unique: true
    end
  end
end
