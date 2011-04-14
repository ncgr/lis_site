module UserProfilesHelper

  #
  # User's full name
  #
  def find_user_name(id)
    user = User.find(id)
    if user
      name = "#{user.first_name.capitalize} #{user.last_name.capitalize}"
    else
      name = "[Not found]"
    end
    name
  end

end
