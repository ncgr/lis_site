
class ApplicationController < ActionController::Base

  before_filter :check_existing_cas_session
  protect_from_forgery

  #
  # Determine whether an existing CAS session was created by checking
  # the cookie tgt (ticket generating ticket).
  #
  def check_existing_cas_session
    unless request.cookies["tgt"].blank?
      authenticate_user!
    end
  end

  #
  # Only admins may send invitations.
  #
  def authenticate_inviter!
    if user_signed_in?
      unless (has_role? :superuser) || (has_role? :admin)
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
