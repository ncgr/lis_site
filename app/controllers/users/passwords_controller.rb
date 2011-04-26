#
# Override Devise::PasswordsController
#
class Users::PasswordsController < Devise::PasswordsController

  # GET /resource/password/new
  def new
    build_resource({})
    render_with_scope :new
  end
  
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

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
    render_with_scope :edit
  end

  # 
  # Override update to redirect home after update and edit on error.
  #
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :updated) if is_navigational_format?
      respond_with resource, :location => root_path 
    else
      render_with_scope :edit 
    end
  end

end
