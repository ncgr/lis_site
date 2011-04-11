module UserProfilesHelper

  #
  # User's full name
  #
  def find_user_name(id)
    user = User.find(id)
    if user
      return "#{user.first_name.capitalize} #{user.last_name.capitalize}"
    else
      return "[Not found]"
    end
  end

end
