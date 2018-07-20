# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: [:edit, :update, :show, :destroy]

  def index
    if !params[:location].blank?
      @merchants = current_user.merchants.by_location(params[:location])
    else
      @merchants = user_merchants
    end

    respond_to do |format|
		  format.html { render :index }
		  format.json { render json: @merchants }
      format.js
		end
  end

  def new
    @merchant = user_merchants.build
    @link = @merchant.links.build
  end

  def create
    @merchant = user_merchants.build(merchant_params)
    if @merchant.save
      Scraper.scrape_square(@merchant)
      redirect_to authenticated_root_path, notice: "#{@merchant.name} created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to authenticated_root_path, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @merchant }
    end
  end

  def favorite
    # need to actually scrape each merchant here to get their up-to-date star count.
    if !user_merchants.empty?
    @favorite = user_merchants.current_favorite(user_merchants.count_stars)
    #Scraper.scrape_square(@favorite.first)
    end
  end

  def destroy
    name = @merchant.name

    @merchant.destroy
    redirect_to merchants_path, notice: "#{name} deleted successfully."
  end

  private
  def merchant_params
    params.require(:merchant).permit(:name, :uid, :location, links_attributes: [:url, category_attributes: [:name]])
  end

  def user_merchants
    current_user.merchants
  end

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end
end
