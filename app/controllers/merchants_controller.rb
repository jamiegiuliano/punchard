class MerchantsController < ApplicationController


  def index
  end

  def new
    @user = current_user
    @merchant = @user.merchants.build
  end

  def create
    @user = User.find_by(params[:user_id])
    @merchant = @user.merchants.build(merchant_params)
    if !@merchant.link.url.empty? && @merchant.save
      redirect_to authenticated_root_path
    else
      flash[:errors] = "Make sure URL is valid"
      render :new
    end
  end

  def show
  end

  private
  def merchant_params
    params.require(:merchant).permit(:user_id, :name, :location, link_attributes: [:url])
  end
end
