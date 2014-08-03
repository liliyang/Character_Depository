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
    mail to: @user.email, subject: "Your New Character #{@character.name} Has Been Submitted. Thanks!"
  end
  
  def character_approved(character)
    @character = character
    @user = character.user
    mail to: @user.email, subject: "Your New Character #{@character.name} Has Been Approved!"
  end
  
  def hatching_posts(post)
    @post = post
    mail to: "mglady3@gmail.com", subject: @post.title
  end
  
  def new_dragon_email(egg, user)
    @egg = egg
    @user = user
    mail to: "mglady3@gmail.com", subject: "Impression - #{@egg.creature_name}"
  end
end
