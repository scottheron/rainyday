class User < ActiveRecord::Base
  belongs_to :zip

  has_secure_password

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
  
end
