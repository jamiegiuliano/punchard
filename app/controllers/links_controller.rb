class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]

  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to user_merchant_path(current_user, current_merchant)
  end

  def edit
    @merchant = current_merchant
  end

  def update
    if @link.update(link_params)
      redirect_to user_merchant_path(current_user, current_merchant), notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to user_merchant_path(current_user, current_merchant)
  end

  private
  def link_params
    params.require(:link).permit(:url, :merchant_id, category_attributes: [:name])
  end

  def current_merchant
    Merchant.find_by(id: params[:merchant_id])
  end

  def set_link
    @link = Link.find_by(id: params[:id])
  end
end
