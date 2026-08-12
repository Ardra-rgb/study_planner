class ApplicationController < ActionController::Base

  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :logged_in?

  def logged_in?
    session[:user_id].present?
  end

end