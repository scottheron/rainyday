require 'bcrypt'

class User < ActiveRecord::Base
  belongs_to :zip
  # # users.password_hash in the database is a :string
  # include BCrypt
  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

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
