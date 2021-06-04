class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:user_type])
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert]="Access denied"
    redirect_to projects_path 
  end

end
