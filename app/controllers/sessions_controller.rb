class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = Employer.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to employers_url
    else
      render 'new'
    end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to login_url
  end
  
end