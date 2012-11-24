class EmployersController < ApplicationController
  
  before_filter :ensure_logged_in, except: [:new, :create]
  before_filter :ensure_correct_user_type

  def ensure_correct_user_type
    if session[:user_id]
      flash[:message] = "Users are not allowed to see any Employer pages."
      redirect_to user_url(session[:user_id])
    end
  end

  
  def index
    @employers = Employer.all
  end
  
  def new
    @employer = Employer.new
  end
  
  def create
    @employer = Employer.new params[:employer]
    if @employer.save
        GeneralMailer.employer_signup_confirmation(@employer).deliver
        flash[:message] = "Thanks for signing up, a confirmation e-mail has been sent to #{@employer.email}."
        session[:employer_id]=@employer.id
        redirect_to employer_url(session[:employer_id])
    end
  end
  
  def show
    @employer = Employer.find_by_id(params[:id])
  end
  
  def edit
    @employer = Employer.find_by_id(params[:id])
  end
  
  def update
    @employer = Employer.find_by_id(params[:id])
    @employer.update_attributes(params[:employer])
    
    redirect_to employer_path
  end
  
  def destroy
    @employer = Employer.find_by_id(params[:id])
    @employer.destroy
    
    redirect_to employers_url
  end
  
  
  
end