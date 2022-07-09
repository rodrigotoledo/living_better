class UserMailer < ApplicationMailer
  def information_updated(user)
    @user = user

    mail to: Rails.env.test? ? @user.email : Rails.application.credentials.config[:mailer_username]
  end
end
