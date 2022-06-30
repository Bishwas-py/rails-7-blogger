class ApplicationController < ActionController::Base
  before_action :configure_account_update_params, if: :devise_controller?

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end