class UserMailer < ApplicationMailer
  def information_updated(user)
    @user = user

    mail to: @user.email
  end
end
