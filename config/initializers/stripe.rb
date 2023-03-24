# >>>>> WALLIM:
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY'],
  signing_secret: ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  # PRODUCTS:
  events.subscribe 'product.create' do |event|
    product = event.data.object
    StripeService::Products::Create.call(product: product)
  end

  events.subscribe 'product.update' do |event|
    product = event.data.object
    StripeService::Products::Update.call(product: product)
  end

  events.subscribe 'product.delete' do |event|
    product = event.data.object
    StripeService::Products::Delete.call(product: product)
  end

  # PRICES:
  events.subscribe 'price.create' do |event|
    price = event.data.object
    StripeService::Prices::Create.call(price: price)
  end

  events.subscribe 'price.update' do |event|
    price = event.data.object
    StripeService::Prices::Update.call(price: price)
  end

  events.subscribe 'price.delete' do |event|
    price = event.data.object
    StripeService::Prices::Delete.call(price: price)
  end
end