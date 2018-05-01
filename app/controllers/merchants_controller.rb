require 'pry'

class MerchantsController < ApplicationController
  def new
    @merchant = Merchant.new(user_id: session[:user_id])
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if !@merchant.link.url.empty? && @merchant.save
      redirect_to user_path(@merchant.user)
    else
      render :new
    end
  end

  private
  def merchant_params
    params.require(:merchant).permit(:user_id, :name, :location, link_attributes: [:url])
  end
end
