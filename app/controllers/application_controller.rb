class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
