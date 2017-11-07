class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  helper_method :current_author, :current_client
  attr_reader :current_author, :current_client

  def current_author
    @current_author ||= current_user.try(:author)
  end

  def current_client
    @current_client ||= current_user.try(:client)
  end





  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
