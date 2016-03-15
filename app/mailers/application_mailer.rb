# Class for the application mailer
class ApplicationMailer < ActionMailer::Base
  default from: "rainydayapp@gmail.com"
  layout 'mailer'
end
