class UserProfilesController < ApplicationController

  before_filter :authenticate_user!
  filter_access_to :all

  #
  # Superuser index
  #
  def index
    order_by = check_kaminari_sort(User, params[:sort], params[:dir])
    @profiles = User.order(order_by).includes(:roles).page(params[:page])
  end

  #
  # Any user may view their profile. Only superusers may
  # view all profiles.
  #
  def show
    @profile = User.find(params[:id])
    unless has_role? :superuser
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
    if @profile.destroy
      flash[:notice] = "Successfully deleted user."
      redirect_to user_profiles_path
    else
      flash[:error] = "Unable to delete user."
      render :action => "show"
    end
  end

  #
  # Manage user's role
  #
  def manage_roles
    @profile = User.find(params[:id])
    @all_roles = Role.all
  end

  #
  # Update user's role
  #
  def update_roles
    @profile = User.find(params[:id])
    @all_roles = Role.all
    begin
      UserRole.transaction do
        UserRole.destroy_all(:user_id => @profile.id)
        for role_id in params[:user_role]
          new_role = @profile.user_roles.build
          new_role.role_id = role_id
          new_role.save!
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = 'Could not save user roles.'
      render :action => 'manage_roles'
    rescue => e
      flash[:error] = 'Could not save user roles. %s' % e
      # log backtrace
      logger.error e.inspect
      logger.error "backtrace:\n" + e.backtrace.join("\n")
      render :action => 'manage_roles'
      return
    end
    flash[:notice] = 'Successfully updated roles.'
    redirect_to user_profiles_path
  end

end
