class SessionsController < ApplicationController
  
  def landingpage
     #The front page of the website
  end

  def newemployer
    
  end
  
  def create_employer
    user = Employer.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to employers_url
    else
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil #KILL THIS GODDAMN THING
    flash[:notice] = "Hey, thanks for using us, we mean it."
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
      flash[:message] = "Invalid login e-mail"
      redirect_to root_url

    end
  end
  
end