class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:edit, keys: [:user_name])
  end

  

end

