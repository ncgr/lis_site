#
# Override Devise::PasswordsController
#
class Users::PasswordsController < Devise::PasswordsController

  #
  # Override create to redirect home after new password request and edit on error.
  #
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      respond_with resource, :location => root_path
    else
      render_with_scope :new
    end
  end

  #
  # Override default behavior - bypass sign_in and redirect to root_path after
  # successful update.
  #
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      respond_with resource, :location => root_path
    else
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end

end
