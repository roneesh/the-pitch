class SessionsController < ApplicationController
  
  def landingpage
     #The front page of the website
  end

  def newemployer
    
  end
  
  def create_employer
    employer = Employer.find_by_email(params[:email])
    if employer && employer.authenticate(params[:password]) 
      session[:employer_id] = employer.id
      redirect_to employer_url(employer.id)
    else
     flash[:message] = "Invalid login e-mail or password"
      redirect_to employerlogin_url
    end
  end
  
  def destroy
    session[:user_id] = nil #KILL THIS GODDAMN THING
    session[:employer_id] = nil
    flash[:message] = "Hey, thanks for using us, we mean it."
    redirect_to root_url
  end
  
  def newuser

  end

  def create_user
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:message] = "Invalid login e-mail or password"
      redirect_to userlogin_url
    end
  end
  
end