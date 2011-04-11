
class UserInformationObserver < ActiveRecord::Observer

  #
  # Fire off an email confirmation after successful registration.
  #
  def after_create(user)
    # Only send an email if a user registers. Not if an email invitation is sent.
    unless user.password.blank?
      UserMailer.registration_confirmation(user).deliver
    end
  end

end

