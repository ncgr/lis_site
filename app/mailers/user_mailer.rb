
class UserMailer < ActionMailer::Base
  default :from => "do-not-reply@comparative-legumes.org"
  @@bcc = []

  #
  # Registration confirmation
  #
  def registration_confirmation(user)
    @user = user
    @url = "https://login.comparative-legumes.org"
    mail(:to => user.username, :subject => "Registration Confirmation - DO NOT REPLY")
  end

end

