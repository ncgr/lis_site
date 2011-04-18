
## NOT IN USE ##

class Users::InvitationsController < Devise::InvitationsController

  # GET /resource/invitation/new
  def new
    build_resource
    render_with_scope :new
  end

  # 
  # Override method to change redirect.
  #
  def create
    self.resource = resource_class.invite!(params[resource_name], current_user)
    
    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      redirect_to user_profile_path(current_user.id)
    else
      render_with_scope :new
    end
  end

  #
  # Override method to change redirect.
  #
  def edit
    if params[:invitation_token] && self.resource = resource_class.first(:conditions => { :invitation_token => params[:invitation_token] })
      render_with_scope :edit
    else
      set_flash_message(:alert, :invitation_token_invalid)
      redirect_to root_path
    end
  end

  # 
  # Override method to change redirect.
  #
  def update
    ## Hack to trick the validation. Needs to be refactored in the model. ##
    empty = true
    [:first_name, :last_name, :password].each do |p|
      empty = false unless params[resource_name][p].blank?
    end

    if empty
      self.resource = resource_class.first(:conditions => { :invitation_token => params[resource_name][:invitation_token] })
      flash[:notice] = "Please fill out the form to create an account."
      render_with_scope :edit
      return
    end

    ## end hack ##  

    self.resource = resource_class.accept_invitation!(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :updated
      redirect_to root_path
    else
      render_with_scope :edit
    end
  end

end
