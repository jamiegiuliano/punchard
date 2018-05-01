class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login, except: [:new, :create, :welcome]

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_if_logged_in
    redirect_to @current_user if logged_in?
  end
end
