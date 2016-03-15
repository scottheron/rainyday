# Class for the user mailer. Sets the subject and to address used when sending the 
# password reset mailer.
class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Rainy Day Password Reset'
  end
end