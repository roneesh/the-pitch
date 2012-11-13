class EmployerMailer < ActionMailer::Base
  default from: "LuckyYou@thepitch.com"
  
  def coffee_email(email)
    mail(:to => email, :subject => "Let's get coffee")
  end

end

