class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def success
  end

  def failure
  end

  def profile
    @portal = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: profile_url
    })
  end
end
