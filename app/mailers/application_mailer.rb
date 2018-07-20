# frozen_string_literal: true

# Update if want to send emails from App
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
