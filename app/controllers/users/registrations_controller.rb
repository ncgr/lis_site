#
# Override Devise::RegistrationsController
#
class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  #
  # Override default method.
  #
  def new
    build_resource({})
    render_with_scope :new
  end

  #
  # Override default method to disable sign_in.
  #
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
	      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  #
  # Edit
  #
  def edit
    render_with_scope :edit
  end

  #
  # Override update to avoid sing_in.
  #
  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  #
  # Override destroy to make sure User plus dependents are destroyed and an
  # email is sent.
  #
  def destroy
    user = User.find(resource.id)
    user.destroy
    UserMailer.account_canceled(user).deliver
    respond_with user, :location => destroy_user_session_path
  end

  private

  # Override default
  # Authenticates the current scope and gets a copy of the current resource.
  # We need to use a copy because we don't want actions like update changing
  # the current user in place.
  def authenticate_scope!
    send(:"authenticate_user!", true)
    self.resource = resource_class.to_adapter.get!(send(:"current_user").to_key)
  end

end
