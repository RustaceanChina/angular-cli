
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_for_user
    redirect_to root_path unless current_user
  end
  
  helper_method :current_user
end