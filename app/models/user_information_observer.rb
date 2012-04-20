
class UserInformationObserver < ActiveRecord::Observer

  #
  # Fire off an email confirmation after successful registration.
  #
  def after_create(user)
    UserMailer.registration_confirmation(user).deliver
  end

end

