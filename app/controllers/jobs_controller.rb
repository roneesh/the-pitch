class JobsController < ApplicationController
  
  def index
    @jobs=Job.all
  end
  
  def new
    @job=Job.new
  end
  
  def create
    @job=Job.new params[:job]
    @job.save
    redirect_to jobs_url
  end
  
  def show
     @job=Job.find_by_id(params[:id])
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
     @job.destroy
     
     redirect_to jobs_url
  end
  
end