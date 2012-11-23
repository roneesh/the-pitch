class JobsController < ApplicationController
  
  before_filter :ensure_logged_in


  def index
    @jobs=Job.all
  end
  
  def new
    @job=Job.new
  end
  
  def create
    @job=Job.new(params[:job])
    @job.employer_id = session[:employer_id]
    @job.save
    redirect_to employer_path(@job.employer_id)
  end
  
  def show
     @job=Job.find_by_id(params[:id])
     @pitches = Pitch.where(:job_id => @job.id)
  end
  
  def edit
     @job=Job.find_by_id(params[:id])
  end
  
  def update
     @job=Job.find_by_id(params[:id])
     @job.update_attributes(params[:job])
     
     redirect_to job_url
  end
  
  def destroy
     @job=Job.find_by_id(params[:id])
     employer = @job.employer_id
     @job.destroy
     
     redirect_to employer_url(employer)
  end
  
end