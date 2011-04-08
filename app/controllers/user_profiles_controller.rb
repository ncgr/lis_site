
class UserProfilesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_user_role, :except => :show
  
  # 
  # Superuser index
  #
  def index
    @profiles = User.includes(:role).where("invitation_token IS NULL").order("last_name ASC, role_id ASC").page(params[:page])
  end

  #
  # Superuser view unexcepted invitations.
  #
  def invitations
    @invitations = User.where("invitation_token IS NOT NULL").order("invitation_sent_at DESC").page(params[:page])
  end

  # 
  # Any user may view their profile. Only superusers may
  # view all profiles.
  #
  def show
    @profile = User.includes(:role).find(params[:id])
    unless current_user.has_role? :superuser
      if @profile != current_user
        permission_denied
        return
      end
    end
  end

  # 
  # Superuser destroy
  #
  def destroy
    @profile = User.find(params[:id])
    unless User.destroy params[:id]
      flash[:error] = "Unable to delete user."
      render :action => "show"
    else
      flash[:notice] = "Successfully deleted user."
      redirect_to user_profiles_path
    end
  end

  # 
  # Manage user's role
  #
  def manage_role
    @roles = Role.all
    @profile = User.includes(:role).find(params[:id])
  end

  #
  # Update user's role
  #
  def update_role
    @profile = User.find(params[:id])
    if @profile.update_attributes(:role_id => params[:role_id])
      flash[:notice] = "User role updated successfully"
      redirect_to user_profiles_path
    else
      flash[:error] = "Unable to update user role."
      render :action => "manage_role"
    end 
  end

  private

  # 
  # Must be superuser to access this controller.
  #
  def check_user_role
    unless current_user.has_role? :superuser
      permission_denied
      return
    end
  end

end
