require 'bcrypt'

class User < ActiveRecord::Base

  belongs_to :zip

  has_secure_password

  validates :email,
  presence: true,
  email: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  presence: true,
  length: {
    minimum: 7,
    too_short: "must be greater than %{count} characters"
  }


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
