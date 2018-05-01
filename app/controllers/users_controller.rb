class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  private
  def set_user
    @user = User.find(current_user)
  end

  def user_params
    params.require(:user).permit(:email, :phone_number, :password)
  end
end
