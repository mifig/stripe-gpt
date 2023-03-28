class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def success
  end

  def failure
  end

  def profile
    @portal = StripeService::Customers::BillingPortal.call(user: current_user).portal
  end
end
