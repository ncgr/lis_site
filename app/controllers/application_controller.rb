
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
  
  #
  # Validate Model's sortable columns and direction.
  #
  def check_kaminari_sort(klass, column, dir)
    return nil unless column
    begin
      unless klass::SORTABLE_COLUMNS.include? column
        raise ArgumentError, "Column (#{column.to_s}) is not sortable for model #{klass.to_s}. See #{klass.to_s}::SORTABLE_COLUMNS"
      end
    rescue ArgumentError => e
      puts e.message
      return nil
    end
    safe_col = column
    safe_dir = (dir == 'asc') ? 'asc' : 'desc'    
    return '%s %s' % [safe_col, safe_dir] # sql order by clause
  end
  
end
