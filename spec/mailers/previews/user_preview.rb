# Preview all emails at http://localhost:3000/rails/mailers/user
require 'factory_bot_rails'
class UserPreview < ActionMailer::Preview
  def information_updated
    UserMailer.information_updated(FactoryBot.build(:user))
  end
end
