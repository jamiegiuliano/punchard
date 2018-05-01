class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :phone_number, :password)
  end
end
