class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def verify_admin
      unless user_signed_in? && current_user.is_admin
        raise ActionController::RoutingError.new('Not Found')
      end
    end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
