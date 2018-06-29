class LinksController < ApplicationController
  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to user_merchant_path(current_user, current_merchant)
  end

  def edit
  end

  def update
  end

  def destroy
    @link = Link.find_by(id: params[:id])
    @link.destroy
    redirect_to user_merchant_path(current_user, current_merchant)
  end

  private
  def link_params
    params.require(:link).permit(:url, :merchant_id, category_attributes: [:name])
  end

  def current_merchant
    Merchant.find_by(params[:merchant_id])
  end
end
