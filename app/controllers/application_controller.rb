class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_local

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def rescue_with_resource_not_found
    render plain: 'Resource not found'
  end

  def set_local
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end

