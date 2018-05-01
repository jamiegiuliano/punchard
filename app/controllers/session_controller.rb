class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
