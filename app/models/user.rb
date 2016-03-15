# User table belongs to Zip table, 'bcrypt' is required here and validations are done on the 
# password and email fields. User database look ups by email address are handled here
# and the password reset code is generated here and added to the database along with a
# reset link expiration time.
require 'bcrypt'
class User < ActiveRecord::Base
  belongs_to :zip
  has_secure_password
  validates :email,
  presence: true,
  email: true,
  uniqueness: {case_sensitive: false}
  validates :password,
  presence: true, on: :create,
  length: {
    minimum: 7,
    too_short: "must be greater than %{count} characters"
  }
  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
  def set_password_reset
    self.reset_code = loop do
      code = SecureRandom.urlsafe_base64
      break code unless User.exists?(reset_code: code)      
    end
    self.expires_at = 4.hours.from_now
    self.save!
  end
end
