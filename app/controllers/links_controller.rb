# frozen_string_literal: true

# Mainly used for creating and handling link information
class LinksController < ApplicationController
  before_action :set_link, only: %i[edit update show destroy]

  def create
    @link = Link.new(link_params)
    @link.save
    respond_to do |format|
      format.html { redirect_to @link.merchant }
      format.json { render json: @link, status: 202 }
    end
  end

  def edit
    @merchant = current_merchant
  end

  def update
    if @link.update(link_params)
      redirect_to merchant_path(current_merchant),
                  notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render json: @link
  end

  def destroy
    @link.destroy
    redirect_to merchant_path(current_merchant)
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
