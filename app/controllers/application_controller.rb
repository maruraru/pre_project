class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    '/home/index'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation photo remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email photo password password_confirmation current_password])
  end
end
