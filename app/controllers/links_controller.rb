class LinksController < ApplicationController
  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to user_merchant_path(current_merchant)
  end

  def show

  end

  private
  def link_params
    params.require(:link).permit(:url, :merchant_id, category_attributes: ['0' => [:name]])
  end

  def current_merchant
    Merchant.find_by(params[:merchant_id])
  end
end
