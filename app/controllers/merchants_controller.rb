class MerchantsController < ApplicationController
  def new
    @merchant = Merchant.new(user_id: session[:user_id])
  end

  def create
    raise params.inspect
  end
end
