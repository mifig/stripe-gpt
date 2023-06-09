# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_28_153400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", id: false, force: :cascade do |t|
    t.string "stripe_invoice_id"
    t.integer "stripe_amount_paid"
    t.integer "stripe_amount_remaining"
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.string "stripe_invoice_pdf"
    t.boolean "stripe_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_hosted_invoice_url"
    t.index ["stripe_invoice_id"], name: "index_invoices_on_stripe_invoice_id", unique: true
  end

  create_table "plans", id: false, force: :cascade do |t|
    t.string "stripe_product_id", null: false
    t.string "stripe_name"
    t.string "stripe_default_price_id"
    t.text "stripe_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_product_id"], name: "index_plans_on_stripe_product_id", unique: true
  end

  create_table "prices", id: false, force: :cascade do |t|
    t.string "stripe_price_id"
    t.string "stripe_product_id"
    t.string "stripe_recurrance_interval"
    t.integer "stripe_recurrance_interval_count"
    t.integer "stripe_unit_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_price_id"], name: "index_prices_on_stripe_price_id", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "stripe_subscription_id"
    t.string "stripe_product_id"
    t.string "stripe_checkout_session_id"
    t.datetime "stripe_current_period_start"
    t.datetime "stripe_current_period_end"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stripe_quantity"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "subscriptions", "users"
end
