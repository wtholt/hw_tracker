class RegistrationsController < Devise::RegistrationsController
  protected

  # def after_sign_up_path_for(resource)
  #   s = select_locations_path
  #   s
  # end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end

