class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_user

  # make these available as ActionView helper methods
  helper_method :logged_in?

  protected

  # Check if the user is already logged in
  def logged_in?
    @current_user.is_a?(User)
  end

  # setup user info on each page
  def initialize_user
    @current_user = User.find_by_id(session[:user]) unless session[:user].blank?
    puts @current_user
  end

end
