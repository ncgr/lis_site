class ApplicationController < ActionController::Base
  
  protect_from_forgery

  #
  # Only admins may send invitations.
  #
  def authenticate_inviter!
    if user_signed_in?
      unless (current_user.has_role? :superuser) || (current_user.has_role? :admin)
        permission_denied 
        return false
      else
        return current_user
      end
    end
    redirect_to new_user_session_path
  end

  # 
  # I pitty the fool!
  #
  def permission_denied
    flash[:error] = 'Sorry, your account has insufficient privileges for the requested resource.'
    redirect_to :root
  end
  
end
