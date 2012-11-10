class EmployersController < ApplicationController
  
  def index
    @employers = Employer.all
  end
  
  def new
    @employer = Employer.new
  end
  
  def create
    @employer = Employer.new params[:employer]
    @employer.save
    
    redirect_to employers_url
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