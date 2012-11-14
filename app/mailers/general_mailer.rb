class GeneralMailer < ActionMailer::Base
  default from: "thepitch.devteam@gmail"
  
  def coffee_email(pitch)
    @pitch = pitch
    email = @pitch.user.email

    mail to: email, subject: "The Pitch: Let's get coffee"
  end

  def user_signup_confirmation(user)
    @user = user
    email = @user.email
    mail to: email, subject: "A Message From The Pitch"
  end

  def employer_signup_confirmation(employer)
  	@employer = employer
  	email = @employer.email
  	mail to: email, subject: "A Message From The Pitch"
  end

end

