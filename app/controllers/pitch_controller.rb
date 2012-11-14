class  PitchController < ApplicationController
  def index
  	@pitches = Pitch.all
  end

  def show
  	@pitch = Pitch.find_by_id(params[:id])
  end

  def new
  	@pitch = Pitch.new
    @job_id = params[:job_id]
    @sessionid = session[:user_id]
  end

  def create
  	@pitch = Pitch.new(params[:pitch])
  	@pitch.job_id = params[:job_id]
    @pitch.user_id = session[:user_id]
    @pitch.save
  	redirect_to pitches_url
   

  def edit
  	@pitch = Pitch.find_by_id(params[:id])
  end

  def update
  	@pitch = Pitch.find_by_id(params[:id])
  	@pitch.update_attributes(params[:pitch])
  	redirect_to pitch_url(@pitch.id)
  end

  def destroy
  	@pitch = Pitch.find_by_id(params[:id])
  	@pitch.destroy
  	redirect_to pitches_url
  end

  def shorten
    
  end


end