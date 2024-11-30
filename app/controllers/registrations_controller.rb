class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    pets_path(resource)
  end
end
