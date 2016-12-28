class RegistrationsController < Devise::RegistrationsController

  def create
    configure_permitted_parameters
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone])
  end

  def build_resource(hash = nil)
    self.resource = registration_form = RegistrationForm.new(user: User.new, business: Business.new)
    unless hash.nil? || hash.length == 0
      self.resource.validate hash
    end
  end

  def after_sign_in_path_for(resource_or_scope)
   dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end

end
