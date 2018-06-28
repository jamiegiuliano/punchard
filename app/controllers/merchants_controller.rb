class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: [:edit, :update, :show, :destroy]

  def index
    if !params[:location].blank?
      @merchants = user_merchants.by_location(params[:location])
    else
      @merchants = user_merchants
    end
  end

  def new
    @merchant = user_merchants.build
  end

  def create
    binding.pry
    @merchant = user_merchants.build(merchant_params)
    if @merchant.save
      Scraper.scrape_square(@merchant)
      redirect_to authenticated_root_path
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
    if !user_merchants.include?(@merchant)
      redirect_to merchants_path(current_user), notice: "Merchant not found."
    end
  end

  def favorite
    # need to actually scrape each merchant here to get their up-to-date star count.
    @favorite = user_merchants.current_favorite(user_merchants.count_stars)
    Scraper.scrape_square(@favorite.first)
  end

  def destroy
    name = @merchant.name

    @merchant.destroy
    redirect_to user_merchants_path(current_user), notice: "#{name} deleted successfully."
  end

  private
  def merchant_params
    params.require(:merchant).permit(:name, :uid, :location, categories_attributes: [:name], links_attributes: [:url])
  end

  def user_merchants
    current_user.merchants
  end

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end
end
