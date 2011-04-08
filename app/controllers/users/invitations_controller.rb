
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
    self.resource = resource_class.invite!(params[resource_name], current_inviter)
    
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
    self.resource = resource_class.accept_invitation!(params[resource_name])

    empty = true
    [:first_name, :last_name, :password, :password_confirmation].each do |p|
      empty = false unless self.resource[p].blank?
    end

    if resource.errors.empty? || empty
      set_flash_message :notice, :updated
      redirect_to root_path
    else
      render_with_scope :edit
    end
  end

  protected

  def current_inviter
    UserInformation.new(current_user)
  end

end
