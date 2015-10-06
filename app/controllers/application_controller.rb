class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UserHelper

  private

  def require_login
    if not logged_in?
      session[:after_login_action] = request.path
      redirect_to new_session_path
    end
  end
end
