class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(user)
    @user = user
    
    mail to: @user.email, subject: "Thank You for Signing Up. Welcome!"
  end

  def character_confirmation(character)
    @character = character
    @user = character.user

    mail to: @user.email, subject: "Your New Character Has Been Sent For Approval. Thanks!"
  end
end
