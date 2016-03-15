# Controller limites access to all routes other than the main root path unless user is
# logged in. Also sets the current user to the session id
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  def is_authenticated?
    unless current_user
      flash[:warning] = "You need to login to access that"
      redirect_to root_path
    end
  end
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
