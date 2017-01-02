class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  protected

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = exception.message
    redirect_to dashboard_path
  end
end
