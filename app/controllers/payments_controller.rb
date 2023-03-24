class PaymentsController < ApplicationController
  def new
    @subscription = current_user.subscriptions.where(status: "pending").find(params[:subscription_id])
  end
end
