class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!, only: [:edit, :edit_password, :update, :update_password, :destroy]

  def edit_password
    self.resource = current_user
  end

  def update_password
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = resource.update_with_password(password_update_params)
    yield resource if block_given?
    if resource_updated
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      render "edit_password", status: :unprocessable_entity
    end
  end

  protected

  def password_update_params
    params.require(resource_name).permit(:current_password, :password, :password_confirmation)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    authenticated_root_path
  end
end
