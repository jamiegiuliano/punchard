# frozen_string_literal: true

# Main controller
class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: %i[edit update show destroy]
  before_action :set_merchants, only: %i[index]

  def index
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
    # Square API changed, temp solution since scraping no longer allowed
    if @merchant.image.nil?
      @merchant.image = 'https://source.unsplash.com/collection/896121/150x150'
    end
    if @merchant.save
      #Scraper.scrape_square(@merchant)
      redirect_to authenticated_root_path,
                  notice: "#{@merchant.name} created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @merchant.update(merchant_params)
      redirect_to authenticated_root_path,
                  notice: 'Merchant was successfully updated.'
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
    merchant_stars = user_merchants.count_stars
    return @favorite = user_merchants.current_favorite(merchant_stars) unless
    user_merchants.empty?
    # Scraper.scrape_square(@favorite.first)
  end

  def destroy
    name = @merchant.name

    @merchant.destroy
    redirect_to merchants_path, notice: "#{name} deleted successfully."
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :uid, :location, :star_count, links_attributes: [:url, category_attributes: [:name]])
  end

  def user_merchants
    current_user.merchants
  end

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end

  def set_merchants
    # Checking for filter input
    if params[:location].blank?
      @merchants = user_merchants
    else
      @merchants = current_user.merchants.by_location(params[:location])
    end
  end
end
