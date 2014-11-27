class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_user

  # make these available as ActionView helper methods
  helper_method :logged_in?, :is_admin?

  protected

  # Check if the user is already logged in
  def logged_in?
    @current_user.is_a?(User)
  end

  def is_admin?
    logged_in? && @current_user.is_admin?
  end

  def admin_required
    redirect_to_login unless is_admin?
  end

  def login_required
    redirect_to_login unless logged_in?
  end

  def redirect_to_login
    redirect_to new_session_path
  end

  # setup user info on each page
  def initialize_user
    @current_user = User.find_by_id(session[:user]) unless session[:user].blank?
    puts @current_user
  end

end
