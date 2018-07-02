class UsersController < ApplicationController
  def show
    if !params[:location].blank?
      @merchants = current_user.merchants.by_location(params[:location])
    else
      @merchants = current_user.merchants
    end
  end
end
