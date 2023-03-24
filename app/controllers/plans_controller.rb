class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find_by(stripe_name: params[:stripe_name])
  end
end
