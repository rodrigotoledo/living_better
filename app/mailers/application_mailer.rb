class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.config[:mailer_username]
  layout "mailer"
end
